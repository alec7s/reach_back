import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:reach_back/globals.dart' as global;
import 'package:reach_back/models/Round.dart';
import 'package:reach_back/db/db.dart';

Db db = Db();

class RoundMatrix extends StatelessWidget {
  RoundMatrix();

  createDataRow(int index, Round round) {
    return DataRow(
      cells: <DataCell>[
        //DATE
        DataCell(
          Center(
            child: Text(
              round.dateYmd,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
          ),
        ),
        //COURSE NAME
        DataCell(
          Center(
            child: Text(
              round.name,
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 25.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        //SCORE
        DataCell(
          Center(
            child: Text(
              round.finalScore.toString(),
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

  generateMatrix() async {
    List<Round> rowList = await db.rounds();
    for (var i = 0; i <= rowList.length; i++) {
      rowList.add(createDataRow(i, rowList[i]));
    }
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
                'Date',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                //DISPLAY COURSE NAME IN THIS COLUMN (NAME)
                'Course',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                //DISPLAY finalScore IN THIS COLUMN
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
