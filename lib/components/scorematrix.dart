import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reach_back/globals.dart' as global;

class ScoreMatrix extends StatelessWidget {
  ScoreMatrix();

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: {
        0: FlexColumnWidth(1.0),
        1: FlexColumnWidth(2.0),
      },
      border: TableBorder.all(),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        //for (var rowData in myRowDataList) TableData(),
      ],
    );
  }
}
