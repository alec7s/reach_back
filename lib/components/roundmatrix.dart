import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
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
              Container(
                width: MediaQuery.of(context).size.width * 0.2,
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
                width: MediaQuery.of(context).size.width * 0.3,
                child: Text(
                  'Date',
                  style: TextStyle(
                    fontSize: 30.0,
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
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.2,
                child: Text(
                  'Score',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 20.0,
            child: Divider(color: Colors.white),
          ),
          //ROWS OF EXTRACTED DATA
          createMatrix(context),
        ]),
      ),
    );
  }
}
