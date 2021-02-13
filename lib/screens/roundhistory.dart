import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ReachBack/components/roundmatrix.dart';
import 'package:ReachBack/db/database_helper.dart';
import 'package:ReachBack/components/WideButton.dart';

class RoundHistory extends StatefulWidget {
  List<Map<String, dynamic>> data;
  RoundHistory(this.data);

  @override
  RoundHistoryState createState() {
    return RoundHistoryState();
  }
}

class RoundHistoryState extends State<RoundHistory> {
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
              }),
            ],
          ),
        ),
      ),
    );
  }
}
