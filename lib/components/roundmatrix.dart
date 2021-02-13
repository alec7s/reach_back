import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class RoundMatrix extends StatefulWidget {
  List<Map<String, dynamic>> data;
  RoundMatrix(this.data);

  @override
  _RoundMatrixState createState() => _RoundMatrixState();
}

class _RoundMatrixState extends State<RoundMatrix> {
  int selectedRow;
  List<int> rowNumberList = [];

  Widget createMatrix(context) {
    if (widget.data != null) {
      List<Widget> rows = [];
      for (var i = 0; i < widget.data.length; i++) {
        //EXTRACT DATA FROM MAP RECORD INTO CELLS
        String date = widget.data[i]['date'];
        String name = widget.data[i]['name'];
        int finalScore = widget.data[i]['finalScore'];
        //ADD rowNumber to rowNumberList, rowNumber TO BE USED AS RADIO BUTTON GROUP VALUE
        rowNumberList.add(i + 1);
        //SAVE ROWS WITH DATA INTO ROWS LIST
        rows.add(
          //UPDATE RADIO BUTTON WHEN ANY PART OF ROW IS TAPPED
          GestureDetector(
            onTap: () {
              setState(() {
                selectedRow = rowNumberList[i];
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.08,
                  child: Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Theme(
                      data: ThemeData.dark(),
                      //TODO: CONFIRM WORKING AFTER CHANGING TO STATEFUL
                      child: Radio(
                        activeColor: Colors.redAccent,
                        value: rowNumberList[i],
                        groupValue: selectedRow,
                        onChanged: (value) {
                          setState(() {
                            selectedRow = rowNumberList[i];
                          });
                          print('Row $selectedRow selected');
                        },
                      ),
                    ),
                  ),
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
