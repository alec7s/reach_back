import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reach_back/globals.dart' as global;

class ScoreMatrix extends StatelessWidget {
  ScoreMatrix();

  createTableRow(int index) {
    return TableRow(children: [
      Text(
        global.newCourse.getHoleNumber(index).toString(),
        style: TextStyle(color: Colors.white, fontSize: 25.0),
      ),
      Text(
        global.newCourse.getScore(index).toString(),
        style: TextStyle(color: Colors.white, fontSize: 25.0),
      ),
    ]);
  }

  generateMatrix() {
    for (var i = 0; i < global.newCourse.getHoleNumbersLen(); i++) {
      createTableRow(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: {
        0: FlexColumnWidth(10.0),
        1: FlexColumnWidth(10.0),
      },
      border: TableBorder.all(width: 1.0, color: Colors.white),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 3.0),
            child: Text(
              'Hole',
              style: TextStyle(color: Colors.white, fontSize: 25.0),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Score',
              style: TextStyle(color: Colors.white, fontSize: 25.0),
            ),
          ),
          generateMatrix(),
        ]),
      ],
    );
  }
}
