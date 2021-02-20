import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ReachBack/components/IcnButton.dart';
import 'package:ReachBack/globals.dart' as global;
import 'package:ReachBack/models/Round.dart';
import 'package:ReachBack/screens/scorecard.dart';
import 'package:ReachBack/components/WideButton.dart';
import 'package:ReachBack/components/formfield.dart';

//CREATE COURSEFORM FOR NEW COURSE ENTRY
//USE INFO ENTERED TO GENERATE NEW COURSE AND SCORECARD
class CourseForm extends StatefulWidget {
  @override
  CourseFormState createState() {
    return CourseFormState();
  }
}

class CourseFormState extends State<CourseForm> {
  final _formKey = GlobalKey<FormState>();
  final _fieldController = TextEditingController();
  int inputStart;
  int inputEnd;
  Color startHoleColor;
  Color endHoleColor;

  //CHANGE HOLE NUMBER WHEN PLUS/MINUS BUTTON PRESSED
  changeHoleNumber(int hole, String action, String holeType) {
    //INCREASE HOLE NUMBER DEPENDING ON HOLE TYPE
    if (action == 'add') {
      if ((hole + 1) < 100) {
        print(action);
        if (holeType == 'start') {
          inputStart++;
          print('$holeType hole = $inputStart');
        } else if (holeType == 'end') {
          inputEnd++;
          print('$holeType hole = $inputEnd');
        }
      }
      //DECREASE HOLE NUMBER DEPENDING ON HOLE TYPE
    } else if (action == 'subtract') {
      if ((hole - 1) >= 0) {
        print(action);
        if (holeType == 'start') {
          inputStart--;
          print('$holeType hole = $inputStart');
        } else if (holeType == 'end') {
          inputEnd--;
          print('$holeType hole = $inputEnd');
        }
      }
    } else {
      hole = hole;
    }
  }

  //SET HOLE NUMBER COLOR DEPENDING WHEN HOLE NUMBER CHANGES FROM
  //PRESSING PLUS/MINUS BUTTON
  Color setHoleNumColor(int hole, String holeType) {
    //
    if (holeType == 'start') {
      if (hole == 0) {
        return startHoleColor = Colors.white38;
      } else {
        return startHoleColor = Theme.of(context).accentColor;
      }
    } else if (holeType == 'end') {
      if (hole == 0) {
        return endHoleColor = Colors.white38;
      } else {
        return endHoleColor = Theme.of(context).accentColor;
      }
    }
    return Colors.white38;
  }

  //CREATE NEW ROUND USING INFO ENTERED IN FORM
  //MOVE TO SPECIFIED SCREEN (NAV) IF FIELDS ARE VALIDATED
  createRound(nav) {
    //VALIDATE FORM ENTRIES
    //REQUIRE ENTRIES INTO ALL FIELDS AND END TO BE GREATER THAN START
    if (_formKey.currentState.validate() &&
        (inputStart != 0) &&
        (inputEnd >= inputStart)) {
      print('Form validated');
      global.newRound = Round(
        _fieldController.text,
        inputStart,
        inputEnd,
      );
      global.buttonNav(context, () => nav);
    } else {
      print('Error validating form');
    }
  }

  @override
  void initState() {
    //TODO: DOUBLE CHECK WHETHER OR NOT THESE VARS BELONG IN INITSTATE
    super.initState();
    inputStart = 0;
    inputEnd = 0;
    startHoleColor = Colors.white38;
    endHoleColor = Colors.white38;
  }

  //CLEAR FIELD CONTROLLER
  @override
  void dispose() {
    _fieldController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Theme.of(context).accentColor.withOpacity(0.9),
          title: const Text('Course Information'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //FORM FOR NEW COURSE ENTRY
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 40.0),
                    global.fieldLabel('Course Name:'),
                    //FREE TEXT FIELD
                    CourseFormField(double.infinity, _fieldController),
                    //SPACER FOR FORMATTING
                    SizedBox(height: 50.0),
                    //HOLDS WIDGETS FOR START HOLE
                    Row(
                      children: [
                        global.fieldLabel('Starting Hole: '),
                        //SPACER FOR FORMATTING
                        SizedBox(width: 10.0),
                        //SUBTRACT START HOLE
                        //MINUS BUTTON
                        IcnButton(
                            Icons.remove, 35.0, Colors.white70.withOpacity(0.5),
                            //ON PRESSED
                            () {
                          setState(() {
                            changeHoleNumber(inputStart, 'subtract', 'start');
                            setHoleNumColor(inputStart, 'start');
                          });
                        }),
                        //STARTING HOLE NUMBER. UPDATES WHEN PLUS/MINUS BUTTON PRESSED
                        Container(
                          margin: EdgeInsets.fromLTRB(13.5, 0.0, 10.0, 0.0),
                          padding: EdgeInsets.fromLTRB(0.0, 4.25, 0.0, 4.25),
                          color: Colors.grey[900].withOpacity(0.5),
                          width: 50.0,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: Text(
                            inputStart.toString().padLeft(2, '0'),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: startHoleColor,
                                fontSize: 35.0,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 5.0),
                          ),
                        ),
                        //PLUS BUTTON
                        IcnButton(
                            Icons.add, 35.0, Colors.white70.withOpacity(0.5),
                            //ON PRESSED
                            () {
                          setState(() {
                            changeHoleNumber(inputStart, 'add', 'start');
                            setHoleNumColor(inputStart, 'start');
                          });
                        }),
                      ],
                    ),
                    //SPACER FOR FORMATTING
                    SizedBox(height: 45.0),
                    //HOLDS WIDGETS FOR END HOLE
                    Row(
                      children: [
                        global.fieldLabel('Ending Hole: '),
                        //SPACER FOR FORMATTING
                        SizedBox(width: 25.0),
                        //SUBTRACT END HOLE
                        //MINUS BUTTON
                        IcnButton(
                            Icons.remove, 35.0, Colors.white70.withOpacity(0.5),
                            () {
                          setState(() {
                            changeHoleNumber(inputEnd, 'subtract', 'end');
                            setHoleNumColor(inputEnd, 'end');
                          });
                        }),
                        //END HOLE NUMBER. UPDATES WHEN PLUS/MINUS BUTTON PRESSED
                        Container(
                          margin: EdgeInsets.fromLTRB(13.5, 0.0, 10.0, 0.0),
                          padding: EdgeInsets.fromLTRB(0.0, 4.25, 0.0, 4.25),
                          color: Colors.grey[900].withOpacity(0.5),
                          width: 50.0,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: Text(
                            inputEnd.toString().padLeft(2, '0'),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: endHoleColor,
                                fontSize: 35.0,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 5.0),
                          ),
                        ),
                        //MINUS BUTTON
                        IcnButton(
                            Icons.add, 35.0, Colors.white70.withOpacity(0.5),
                            () {
                          setState(() {
                            changeHoleNumber(inputEnd, 'add', 'end');
                            setHoleNumColor(inputEnd, 'end');
                          });
                        }),
                      ],
                    ),
                    //SPACER FOR FORMATTING
                    SizedBox(height: 65.0),
                    //START ROUND BUTTON MOVES TO NEW SCORECARD SCREEN IN NEW MODE
                    WideButton(
                      'Start Round',
                      () {
                        createRound(ScoreCard("new"));
                        //global.setHoleNumber('next');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
