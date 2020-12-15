import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reach_back/components/scorematrix.dart';
import 'package:reach_back/globals.dart' as global;

class ScoreTable extends StatefulWidget {
  @override
  ScoreTableState createState() {
    return ScoreTableState();
  }
}

class ScoreTableState extends State<ScoreTable> {
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Theme.of(context).accentColor.withOpacity(0.9),
          title: Text(global.newCourse.getName()),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 15.0),
                margin: EdgeInsets.only(bottom: 15.0),
                alignment: Alignment.center,
                child: Text(
                  'Round Summary',
                  style: TextStyle(color: Colors.white, fontSize: 40.0),
                ),
              ),
              ScoreMatrix(),
            ],
          ),
        ),
      ),
    );
  }
}
