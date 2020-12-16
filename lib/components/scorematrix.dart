import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reach_back/globals.dart' as global;

class ScoreMatrix extends StatelessWidget {
  ScoreMatrix();

  createTableRow(int index) {
    print('hole: ' + global.newCourse.getHoleNumber(index).toString());
    print('score: ' + global.newCourse.getScore(index).toString());
    return DataRow(cells: <DataCell>[
      DataCell(
        Text(
          global.newCourse.getHoleNumber(index).toString(),
          style: TextStyle(color: Colors.white, fontSize: 25.0),
        ),
      ),
      DataCell(
        Text(
          global.newCourse.getScore(index).toString(),
          style: TextStyle(color: Colors.white, fontSize: 25.0),
        ),
      ),
    ]);
  }

  generateMatrix() {
    List<DataRow> rowList = new List(global.newCourse.getHoleNumbersLen());
    for (var i = 0; i < global.newCourse.getHoleNumbersLen(); i++) {
      rowList[i] = createTableRow(i);
    }
    return rowList;
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Hole',
            style: TextStyle(fontSize: 25.0, color: Colors.white),
          ),
        ),
        DataColumn(
          label: Text(
            'Score',
            style: TextStyle(fontSize: 25.0, color: Colors.white),
          ),
        ),
      ],
      rows: generateMatrix(),
    );
  }
}
