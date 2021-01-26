import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:ReachBack/globals.dart' as global;

class ScoreMatrix extends StatelessWidget {
  ScoreMatrix();

  createDataRow(int index) {
    return DataRow(
      cells: <DataCell>[
        DataCell(
          Center(
            child: Text(
              global.newCourse.getHoleNumber(index).toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
          ),
        ),
        DataCell(
          Center(
            child: Text(
              global.newCourse.getScore(index).toString(),
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 25.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  createSumRow(int sum) {
    return DataRow(cells: <DataCell>[
      DataCell(
        Center(
          child: Text(
            'Total',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),
          ),
        ),
      ),
      DataCell(
        Center(
          child: Text(
            sum.toString(),
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ]);
  }

  generateMatrix() {
    int scoreSum = 0;
    List<DataRow> rowList = [];
    var i = 0;
    for (; i < global.newCourse.getHoleNumbersLen(); i++) {
      scoreSum += global.newCourse.getScore(i);
      rowList.add(createDataRow(i));
    }
    rowList.add(createSumRow(scoreSum));
    return rowList;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.white,
        ),
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'Hole',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Score',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
          rows: generateMatrix(),
        ),
      ),
    );
  }
}
