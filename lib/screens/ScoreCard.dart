import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reach_back/Globals.dart' as global;

class ScoreCard extends StatefulWidget {
  @override
  ScoreCardState createState() {
    return ScoreCardState();
  }
}

class ScoreCardState extends State<ScoreCard> {
  int score = 0;
  Color scoreColor;
  Color setScoreColor() {
    if (score == 0) {
      return scoreColor = Colors.white38;
    } else {
      return scoreColor = Theme.of(context).accentColor;
    }
  }

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
            children: <Widget>[
              global.hrzSpacer(10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //TODO: HIDE BACK BUTTON ON HOLE 1
                  //BACK TO PREVIOUS HOLE BUTTON
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: 100.0,
                    child: IconButton(
                      alignment: Alignment.center,
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white70.withOpacity(0.5),
                        size: 90.0,
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 140.0,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: Text(
                          'Hole',
                          style: TextStyle(
                              letterSpacing: 6.0,
                              fontSize: 40.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.w100),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: 140.0,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: Text(
                          global.holeNumber.toString(),
                          style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.white.withOpacity(0.8),
                              fontWeight: FontWeight.w800),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                          height: 12.0,
                          width: 130.0,
                          child: Divider(color: Colors.white70)),
                    ],
                  ),
                  //GO TO NEXT HOLE
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: 100.0,
                    child: IconButton(
                      alignment: Alignment.center,
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white70.withOpacity(0.5),
                        size: 90.0,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 5),
                color: Colors.grey[900].withOpacity(0.5),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.47,
                child: Text(
                  score.toString().padLeft(2, '0'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: setScoreColor(),
                      fontSize: 280.0,
                      fontWeight: FontWeight.w100,
                      letterSpacing: 10.0),
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: 140.0,
                      child: IconButton(
                        alignment: Alignment.center,
                        icon: Icon(
                          Icons.remove,
                          color: Colors.white70.withOpacity(0.5),
                          size: 120.0,
                        ),
                        onPressed: () {
                          score++;
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: 140.0,
                      child: IconButton(
                        alignment: Alignment.center,
                        icon: Icon(
                          Icons.add,
                          color: Colors.white70.withOpacity(0.5),
                          size: 120.0,
                        ),
                        onPressed: () {
                          if (score > 0) {
                            score--;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
