import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reach_back/Course.dart';
import 'Hole.dart';
import 'Globals.dart' as global;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReachBack',
      //TODO: WORK ON STANDARD THEME TO USE THROUGHOUT
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.redAccent,
        primaryTextTheme: TextTheme(
          headline6: TextStyle(color: Colors.white),
        ),
        buttonColor: Colors.white24,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'ReachBack'),
    );
  }
}

class Button extends StatelessWidget {
  final label;
  final VoidCallback onPress;
  double height;
  double width;
  Button(this.label, this.onPress);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40.0,
      child: RaisedButton(
        color: Theme.of(context).buttonColor,
        disabledColor: Theme.of(context).buttonColor,
        textColor: Colors.white,
        child: Text(
          label,
          style: TextStyle(fontSize: 20),
        ),
        onPressed: onPress,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //HOME SCREEN -- LANDING SCREEN WHEN APP IS OPENED
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.height * 0.29,
                  backgroundImage: AssetImage('images/ReachBackLogo.png'),
                ),
              ),
              global.hrzSpacer(40.0),
              Button(
                'New Round',
                () {
                  global.buttonNav(context, () => CourseForm());
                },
              ),
              global.hrzSpacer(40.0),
              Button(
                'Continue Previous Round',
                () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CourseForm extends StatefulWidget {
  @override
  CourseFormState createState() {
    return CourseFormState();
  }
}

//NEW COURSE FORM
class CourseFormState extends State<CourseForm> {
  //VARIABLES
  FocusNode formFocusNode;
  final _formKey = GlobalKey<FormState>();
  List<TextEditingController> _fldControllers;
  String courseName;
  String description;
  int startHole;
  int endHole;

  //FUNCTIONS
  createCourse(nav, List contValues, List controllers) {
    if (_formKey.currentState.validate()) {
      print('Form Validated');
      setState(() {
        for (var i = 0; i < contValues.length; i++) {
          contValues[i] = controllers[i];
        }
      });
      global.newCourse = Course(
        _fldControllers[0].text,
        desc: _fldControllers[1].text,
        start: int.parse(_fldControllers[2].text),
        end: int.parse(_fldControllers[3].text),
      );
      for (int i = 0; i < _fldControllers.length; i++) {
        print(_fldControllers[i].text);
      }
      global.buttonNav(context, () => nav);
    } else {
      print('Validation error');
    }
  }

  @override
  void initState() {
    super.initState();
    formFocusNode = FocusNode();
    _fldControllers = List<TextEditingController>.generate(
      4,
      (index) => TextEditingController(),
    );
  }

  @override
  void dispose() {
    formFocusNode.dispose();

    super.dispose();
  }

  //@override
  //void disposeController() {
  // Clean up the controller when the widget is disposed.
  //_fldControllers[0].dispose();
  //super.dispose();
  //}

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
                    global.hrzSpacer(40.0),
                    //COURSE NAME FIELD
                    global.fieldLabel('Course Name:'),
                    global.formField(
                        controller: _fldControllers[0],
                        focusNode: formFocusNode,
                        width: double.infinity),
                    global.hrzSpacer(45.0),
                    //DESCRIPTION FIELD
                    global.fieldLabel('Description:'),
                    global.formField(
                        hintTxt: "Weather, how you're feeling, etc...",
                        controller: _fldControllers[1],
                        focusNode: formFocusNode,
                        actions: global.getFieldValue(
                            _fldControllers[1], description),
                        width: double.infinity),
                    global.hrzSpacer(45.0),
                    //STARTING HOLE FIELD
                    //TODO: PUT FIELD AND LABEL ON SAME LINE
                    global.fieldLabel('Starting Hole:'),
                    global.formField(
                        keyboard: TextInputType.number,
                        controller: _fldControllers[2],
                        focusNode: formFocusNode,
                        actions:
                            global.getFieldValue(_fldControllers[2], startHole),
                        width: double.infinity),
                    global.hrzSpacer(45.0),
                    //ENDING HOLE FIELD
                    //TODO: PUT FIELD AND LABEL ON SAME LINE
                    global.fieldLabel('Ending Hole:'),
                    global.formField(
                        keyboard: TextInputType.number,
                        controller: _fldControllers[3],
                        focusNode: formFocusNode,
                        actions:
                            global.getFieldValue(_fldControllers[3], endHole),
                        width: double.infinity),
                    global.hrzSpacer(45.0),
                    //START ROUND AND CREATE NEW COURSE
                    Button(
                      'Start Round',
                      () {
                        createCourse(
                            ScoreCard(),
                            [courseName, description, startHole, endHole],
                            _fldControllers);
                        global.setHoleNumber();
                      },
                    ),
                    global.hrzSpacer(global.flexHeight(context))
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

class ScoreCard extends StatefulWidget {
  @override
  ScoreCardState createState() {
    return ScoreCardState();
  }
}

class ScoreCardState extends State<ScoreCard> {
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
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.5),
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
                  '00',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white38,
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
                    //TODO: ADD PLUS/MINUS BUTTONS IN PLACE OF ARROWS
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
