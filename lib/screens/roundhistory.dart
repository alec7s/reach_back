import 'package:ReachBack/screens/scorecard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ReachBack/components/roundmatrix.dart';
import 'package:ReachBack/db/database_helper.dart';
import 'package:ReachBack/components/WideButton.dart';
import 'package:ReachBack/globals.dart' as global;
import 'package:ReachBack/models/Round.dart';

class RoundHistory extends StatefulWidget {
  List<Map<String, dynamic>> data;
  RoundHistory(this.data);

  @override
  RoundHistoryState createState() {
    return RoundHistoryState();
  }
}

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
            IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
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
                  List<String> roundHolesListStr =
                      selectedRoundDataMap['holeList'].split(',');
                  List<int> roundHolesListInt =
                      roundHolesListStr.map(int.parse).toList();
                  int selectedRoundStartInt = roundHolesListInt[0];
                  int selectedRoundEndInt =
                      roundHolesListInt[roundHolesListInt.length - 1];
                  global.newCourse = Round(selectedRoundDataMap['name'],
                      selectedRoundStartInt, selectedRoundEndInt,
                      roundType: "replay");
                  global.buttonNav(context, () {
                    return ScoreCard("replay",
                        previousRoundData: selectedRoundDataMap);
                  });
                } else {
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
