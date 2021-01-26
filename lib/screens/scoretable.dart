import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ReachBack/components/WideButton.dart';
import 'package:ReachBack/components/scorematrix.dart';
import 'package:ReachBack/db/database_helper.dart';
import 'package:ReachBack/globals.dart' as global;
import 'package:ReachBack/screens/homepage.dart';

class ScoreTable extends StatefulWidget {
  @override
  ScoreTableState createState() {
    return ScoreTableState();
  }
}

class ScoreTableState extends State<ScoreTable> {
  int validateScores() {
    int result = 0;
    for (int score in global.newCourse.getScoreList()) {
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
          title: Text(global.newCourse.getName()),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
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
              ScoreMatrix(),
              SizedBox(
                height: 30.0,
              ),
              WideButton('Save',
                  //ON PRESSED
                  () async {
                if (validateScores() == 0) {
                  global.newCourse.setFinalScore();
                  int i = await DatabaseHelper.instance.insert(
                    {
                      'date': global.newCourse.dateYmd,
                      'name': global.newCourse.name,
                      'finalScore': global.newCourse.finalScore
                    },
                  );
                  print('Saved course (id = $i)');
                  global.buttonNav(context, () => HomePage());
                }
              }),
              global.vrtSpacer(
                global.flexHeight(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
