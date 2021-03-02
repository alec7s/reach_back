import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ReachBack/components/WideButton.dart';
import 'package:ReachBack/components/scorematrix.dart';
import 'package:ReachBack/db/database_helper.dart';
import 'package:ReachBack/globals.dart' as global;
import 'package:ReachBack/screens/homepage.dart';

//GENERATE SCREEN THAT DISPLAYS SCORES FROM FINAL ROUND
//USE scorematrix TO DISPLAY SCORES AND HOLE INFO IN A TABLE FORMAT
//INCLUDE SAVE BUTTON AT THE BOTTOM OF THE SCREEN
class ScoreTable extends StatefulWidget {
  @override
  ScoreTableState createState() {
    return ScoreTableState();
  }
}

class ScoreTableState extends State<ScoreTable> {
  //ENSURE SCORES ENTERED FOR ALL HOLES
  int validateScores() {
    int result = 0;
    for (int score in global.newRound.scores) {
      if (score == 0) {
        global.constraintNotifier('Scores cannot be zero');
        result = 1;
        break;
      }
    }
    return result;
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Theme.of(context).accentColor.withOpacity(0.9),
          title: Text(global.newRound.name),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //TITLE:
              Container(
                padding: EdgeInsets.only(top: 15.0),
                margin: EdgeInsets.only(bottom: 15.0),
                alignment: Alignment.center,
                child: Text(
                  'Round Summary',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              //CREATE NEW SCOREMATRIX TO DISPLAY HOLE INFO / SCORES
              ScoreMatrix(),
              //SPACER FOR FORMATTING
              SizedBox(
                height: 30.0,
              ),
              //SAVE BUTTON TO SAVE ROUND INFORMATION TO DB
              //TODO: EDIT ON PRESSED TO EDIT PREVIOUS ROUND IN DB RECORD IF IN REPLAY MODE
              //TODO: UPDATE COURSE RECORD IN DB WITH NEW SCORE AND DATE WHEN SAVING IN REPLAY MODE
              WideButton('Save',
                  //ON PRESSED
                  () async {
                if (validateScores() == 0) {
                  //SET ROUND VALUES AND SAVE INTO FORMATS COMPATIBLE WITH DB VARS
                  global.newRound.setFinalScore();
                  global.newRound.setListStrings();
                  global.newRound.roundStatus = 'Not Played';
                  int i = await DatabaseHelper.instance.insert(
                    {
                      'date': global.newRound.dateYmd,
                      'name': global.newRound.name,
                      'finalScore': global.newRound.finalScore,
                      'holeList': global.newRound.holesString,
                      'scoreList': global.newRound.scoresString,
                      'roundStatus': global.newRound.roundStatus,
                    },
                  );
                  print('Saved course (id = $i)');
                  //RETURN TO HOME PAGE
                  global.buttonNav(context, () => HomePage());
                }
              }),
              //SPACER FOR FORMATTING
              SizedBox(
                height: global.flexHeight(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
