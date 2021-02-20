import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ReachBack/components/IcnButton.dart';
import 'package:ReachBack/globals.dart' as global;
import 'package:ReachBack/screens/scoretable.dart';

class ScoreCard extends StatefulWidget {
  Map<String, dynamic> previousRoundData;
  //WHEN OPENED FROM COURSE FORM scoreCardType = new
  //WHEN OPENED FROM SCORE CARD scoreCardType = replay
  String scoreCardType;
  ScoreCard(this.scoreCardType, {this.previousRoundData});

  @override
  ScoreCardState createState() {
    return ScoreCardState();
  }
}

class ScoreCardState extends State<ScoreCard> {
  int holeIndex;
  int hole;
  Color _holeBackColor;
  int score;
  Color scoreColor;

  void setHoleNumber(String direction) {
    if (direction == 'next') {
      if ((hole + 1) <= global.newRound.end) {
        hole++;
        holeIndex++;
        print('next hole pressed');
      }
    } else if (direction == 'back') {
      if ((hole - 1) >= global.newRound.start) {
        hole--;
        holeIndex--;
        print('previous hole pressed');
      }
    } else {
      //SECTION UNNECESSARY - LEAVING TEMPORARILY FOR CLARITY
      hole = hole;
      holeIndex = holeIndex;
    }
    print('new hole #: ' + hole.toString());
  }

  getScoreValue() {
    score = global.newRound.scores[holeIndex];
  }

  Color setScoreColor() {
    if (score == 0) {
      return scoreColor = Colors.white38;
    } else {
      return scoreColor = Theme.of(context).accentColor;
    }
  }

  Color setMinusButtonColor() {
    if (score == 0) {
      return Colors.white70.withOpacity(0.1);
    } else {
      return Colors.white70.withOpacity(0.5);
    }
  }

  setHoleBackColor() {
    if (hole == global.newRound.start) {
      _holeBackColor = Colors.white70.withOpacity(0.1);
    } else {
      _holeBackColor = Colors.white70.withOpacity(0.5);
    }
  }

  @override
  void initState() {
    super.initState();
    holeIndex = 0;
    hole = global.newRound.start;
    _holeBackColor = Colors.white70.withOpacity(0.1);
    score = global.newRound.scores[holeIndex];
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Theme.of(context).accentColor.withOpacity(0.9),
          title: Text(global.newRound.name),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //BACK TO PREVIOUS HOLE BUTTON
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: 100.0,
                    child: IcnButton(
                      Icons.arrow_back_ios_rounded,
                      90.0,
                      _holeBackColor,
                      //ON PRESSED
                      () {
                        setState(
                          () {
                            if (hole > global.newRound.start) {
                              global.newRound.setScore(holeIndex, score);
                              setHoleNumber('back');
                              setHoleBackColor();
                              getScoreValue();
                            }
                          },
                        );
                      },
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
                        //DISPLAY HOLE #
                        width: 140.0,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: Text(
                          hole.toString(),
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
                    child: IcnButton(
                      Icons.arrow_forward_ios_rounded,
                      90.0,
                      Colors.white70.withOpacity(0.5),
                      () {
                        setState(
                          () {
                            if (hole < global.newRound.end) {
                              global.newRound.setScore(holeIndex, score);
                              setHoleNumber('next');
                              setHoleBackColor();
                              getScoreValue();
                            } else {
                              global.newRound.setScore(holeIndex, score);
                              global.buttonNav(
                                context,
                                () => ScoreTable(),
                              );
                            }
                          },
                        );
                      },
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
                    //SUBTRACT SCORE BUTTON
                    Container(
                      height: MediaQuery.of(context).size.height * 0.16,
                      width: 140.0,
                      child: IcnButton(
                        Icons.remove,
                        100.0,
                        setMinusButtonColor(),
                        () {
                          setState(
                            () {
                              if (score > 0) {
                                score--;
                              }
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.height * 0.1,
                    ),
                    //ADD SCORE BUTTON
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: 140.0,
                      child: IcnButton(
                        Icons.add,
                        100.0,
                        Colors.white70.withOpacity(0.5),
                        () {
                          setState(
                            () {
                              score++;
                            },
                          );
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
