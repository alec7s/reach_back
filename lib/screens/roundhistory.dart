import 'package:ReachBack/screens/scorecard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ReachBack/components/roundmatrix.dart';
import 'package:ReachBack/db/database_helper.dart';
import 'package:ReachBack/components/WideButton.dart';
import 'package:ReachBack/globals.dart' as global;
import 'package:ReachBack/models/Round.dart';

//CREATE SCREEN THAT DISPLAYS INFO FROM PREVIOUSLY SAVED ROUNDS
//ROUND INFO WILL BE DISPLAYED IN TABLE FORMAT WITH ONE ROUND PER ROW
//INCLUDE BUTTON TO CLEAR PREVIOUS ROUND DATA IN APP BAR
//SELECT ROUND TO PLAY AGAINST USING RADIO BUTTON
//INCLUDE BUTTON AT THE BOTTOM OF THE TABLE TO START ROUND PLAYING AGAINST PREVIOUS
class RoundHistory extends StatefulWidget {
  List<Map<String, dynamic>> data;
  RoundHistory(this.data);

  @override
  RoundHistoryState createState() {
    return RoundHistoryState();
  }
}

//TODO: ADD STATUS OF ROUND (WON / LOST / NOT PLAYED)
class RoundHistoryState extends State<RoundHistory> {
  Map<String, dynamic> selectedRoundDataMap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Theme.of(context).accentColor.withOpacity(0.9),
          title: const Text('Previous Rounds'),
          actions: <Widget>[
            //ADD DELETE BUTTON USING TRASH CAN ICON TO CLEAR ROUND HISTORY
            IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                //DISPLAY ALERT DIALOG WHEN TRASH CAN ICON BUTTON IS PRESSED
                onPressed: () {
                  showDialog<void>(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Clear History'),
                          content: SingleChildScrollView(
                            child: Text(
                                'Are you sure you want to clear all previous rounds?'),
                          ),
                          //CONFIRM DELETION
                          actions: <Widget>[
                            TextButton(
                              child: Text('YES'),
                              onPressed: () async {
                                await DatabaseHelper.instance.deleteAll();
                                widget.data = [];
                                setState(() {
                                  Navigator.of(context).pop();
                                });
                              },
                            ),
                            TextButton(
                                child: Text('NO'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                }),
                          ],
                        );
                      });
                })
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RoundMatrix(widget.data),
              //TODO ADD ON PRESS FUNCTION -- ROUTE TO NEW SCORECARD SCREEN
              WideButton("START",
                  //ON PRESSED
                  () {
                print("start button pressed");
                selectedRoundDataMap = global.selectedRound;
                print(selectedRoundDataMap);
                //OPEN SCORECARD IN REPLAY MODE IF ROUND IS SELECTED
                if (selectedRoundDataMap != null) {
                  //CONSTRUCT NEW ROUND USING SELECTED ROUND DATA
                  //SET NUMBER OF HOLES FOR ROUND / SCORE CARD
                  //EXTRACT STRING VAR FROM DB AS LIST
                  List<String> roundHolesListStr =
                      selectedRoundDataMap['holeList'].split(',');
                  //CONVERT LIST FROM STRING TO INT FOR USE IN NEW ROUND OBJECT
                  //THAT'S USED WHEN NEW ROUND IS CREATED
                  List<int> roundHolesListInt =
                      roundHolesListStr.map(int.parse).toList();
                  //SET START HOLE FOR NEW ROUND
                  int selectedRoundStartInt = roundHolesListInt[0];
                  //SET END HOLE FOR NEW ROUND
                  int selectedRoundEndInt =
                      roundHolesListInt[roundHolesListInt.length - 1];
                  //CREATE NEW ROUND USING GLOBAL newRound VARIABLE
                  global.newRound = Round(selectedRoundDataMap['name'],
                      selectedRoundStartInt, selectedRoundEndInt,
                      roundType: "replay");
                  //ROUTE TO NEW SCORECARD SCREEN IN REPLAY MODE
                  //REPLAY MODE WILL USE PREVIOUS ROUND DATA FROM DB TO
                  //SET THE ROUND PARAMETERS, THEN THE USER ATTEMPTS TO
                  //BEAT THE PREVIOUS ROUND'S SCORES IN A NEW ROUND
                  global.buttonNav(context, () {
                    return ScoreCard("replay",
                        previousRoundData: selectedRoundDataMap);
                  });
                } else {
                  //ERROR MESSAGE IF NO ROUND IS SELECTED
                  return global.constraintNotifier("Please select a round");
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
