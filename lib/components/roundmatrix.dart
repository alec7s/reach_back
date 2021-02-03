import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

//TODO: THIS MIGHT NEED TO BE CHANGED TO STATEFUL IF CHECKMARK COLOR WILL CHANGE AFTER PRESSING ROW FLAT BUTTON. NEED TO REVIEW.
class RoundMatrix extends StatelessWidget {
  List<Map<String, dynamic>> data;
  RoundMatrix(this.data);

  Widget createMatrix(context) {
    if (data != null) {
      List<Widget> rows = [];
      for (var i = 0; i < data.length; i++) {
        String date = data[i]['date'];
        String name = data[i]['name'];
        int finalScore = data[i]['finalScore'];
        rows.add(
          FlatButton(
            padding: EdgeInsets.all(0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.08,
                  height: MediaQuery.of(context).size.width * 0.08,
                  color: Colors.white38,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                //DATE CELL
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Center(
                    child: Text(
                      date,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                //COURSE NAME CELL
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Center(
                    child: Text(
                      name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                //SCORE CELL
                Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: Center(
                    child: Text(
                      finalScore.toString(),
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 18.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              print('button pressed');
            },
          ),
        );
        rows.add(
          SizedBox(
            width: double.infinity,
            height: 20.0,
            child: Divider(color: Colors.white),
          ),
        );
      }
      return Column(children: rows);
    } else {
      return Container(
        child: Text(
          'No Data',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.white,
        ),
        child: Column(children: [
          //COLUMN HEADERS
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.width * 0.1,
                //color: Colors.white38,
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.25,
                child: Text(
                  'Date',
                  style: TextStyle(
                    fontSize: 23.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  'Course',
                  style: TextStyle(
                    fontSize: 23.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.15,
                child: Text(
                  'Score',
                  style: TextStyle(
                    fontSize: 23.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 15,
            child: Divider(color: Colors.white),
          ),
          //ROWS OF EXTRACTED DATA
          createMatrix(context),
          SizedBox(
            width: double.infinity,
            height: 13.5,
            child: Divider(color: Colors.white),
          ),
        ]),
      ),
    );
  }
}
