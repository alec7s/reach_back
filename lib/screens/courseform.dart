import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reach_back/components/IcnButton.dart';
import 'package:reach_back/globals.dart' as global;
import 'package:reach_back/models/Course.dart';
import 'package:reach_back/screens/scorecard.dart';
import 'package:reach_back/components/WideButton.dart';
import 'package:reach_back/components/formfield.dart';

class CourseForm extends StatefulWidget {
  @override
  CourseFormState createState() {
    return CourseFormState();
  }
}

//NEW COURSE FORM
class CourseFormState extends State<CourseForm> {
  //VARIABLES
  final _formKey = GlobalKey<FormState>();
  //List<TextEditingController> _fldControllers;
  final _fldController = TextEditingController();
  int inputStart;
  int inputEnd;
  Color startHoleColor;
  Color endHoleColor;

  //FUNCTIONS
  changeHoleNumber(int hole, String action, String holeType) {
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

  Color setNumColor(int hole, String holeType) {
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

  createCourse(nav) {
    if (_formKey.currentState.validate() &&
        (inputStart != 0) &&
        (inputEnd >= inputStart)) {
      print('Form validated');
      global.newCourse = Course(
        _fldController.text,
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
    super.initState();
    //_fldControllers = List<TextEditingController>.generate(
    //3,
    //(index) => TextEditingController(),
    //);
    inputStart = 0;
    inputEnd = 0;
    startHoleColor = Colors.white38;
    endHoleColor = Colors.white38;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    //for (var i = 0; i <= _fldControllers.length; i++) {
    //_fldControllers[i].dispose();
    //}
    _fldController.dispose();
    super.dispose();
  }

//***************************************************
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
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    global.vrtSpacer(40.0),
                    global.fieldLabel('Course Name:'),
                    CourseFormField(double.infinity, _fldController),
                    global.vrtSpacer(50.0),
                    //vrtSpacer
                    Row(
                      children: [
                        global.fieldLabel('Starting Hole: '),
                        SizedBox(width: 10.0),
                        //SUBTRACT START HOLE
                        IcnButton(
                            Icons.remove, 35.0, Colors.white70.withOpacity(0.5),
                            //ON PRESSED
                            () {
                          setState(() {
                            changeHoleNumber(inputStart, 'subtract', 'start');
                            setNumColor(inputStart, 'start');
                          });
                        }),
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
                                //TODO MAKE TEXT COLOR DYNAMIC (> 0 = RED)
                                color: startHoleColor,
                                fontSize: 35.0,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 5.0),
                          ),
                        ),
                        //ADD START HOLE
                        IcnButton(
                            Icons.add, 35.0, Colors.white70.withOpacity(0.5),
                            //ON PRESSED
                            () {
                          setState(() {
                            changeHoleNumber(inputStart, 'add', 'start');
                            setNumColor(inputStart, 'start');
                          });
                        }),
                      ],
                    ),
                    global.vrtSpacer(45.0),
                    //vrtSpacer
                    Row(
                      children: [
                        global.fieldLabel('Ending Hole: '),
                        SizedBox(width: 25.0),
                        //SUBTRACT END HOLE
                        IcnButton(
                            Icons.remove, 35.0, Colors.white70.withOpacity(0.5),
                            () {
                          setState(() {
                            changeHoleNumber(inputEnd, 'subtract', 'end');
                            setNumColor(inputEnd, 'end');
                          });
                        }),
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
                                //TODO MAKE TEXT COLOR DYNAMIC (> 0 = RED)
                                color: endHoleColor,
                                fontSize: 35.0,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 5.0),
                          ),
                        ),
                        //SUBTRACT START HOLE
                        IcnButton(
                            Icons.add, 35.0, Colors.white70.withOpacity(0.5),
                            () {
                          setState(() {
                            changeHoleNumber(inputEnd, 'add', 'end');
                            setNumColor(inputEnd, 'end');
                          });
                        }),
                      ],
                    ),
                    global.vrtSpacer(65.0),
                    //vrtSpacerND AND CREATE NEW COURSE
                    WideButton(
                      'Start Round',
                      () {
                        createCourse(ScoreCard());
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
