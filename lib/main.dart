import 'dart:ffi';

import 'package:flutter/material.dart';
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

class HrzButton extends StatelessWidget {
  final label;
  final VoidCallback onPress;
  double height;
  double width;
  HrzButton(this.label, this.onPress);

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
                child: Image.asset('images/ReachBackLogo.png'),
              ),
              global.hrzSpacer(40.0),
              HrzButton(
                'New Round',
                () {
                  global.buttonNav(context, () => CourseForm());
                },
              ),
              global.hrzSpacer(40.0),
              HrzButton(
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
  createCourse(nav) {
    var newCourse = new Course(courseName,
        desc: description, start: startHole, end: endHole);
    bool validate = _formKey.currentState.validate();
    if (validate) {
      global.buttonNav(context, () => nav);
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
          backgroundColor: Theme.of(context).accentColor,
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
                        actions: global.getFieldValue(
                            _fldControllers[0], courseName),
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
                        controller: _fldControllers[3],
                        focusNode: formFocusNode,
                        actions:
                            global.getFieldValue(_fldControllers[3], endHole),
                        width: double.infinity),
                    global.hrzSpacer(45.0),
                    //START ROUND AND CREATE NEW COURSE
                    HrzButton(
                      'Start Round',
                      () {
                        createCourse(
                          ScoreCard(),
                        );
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
    return SafeArea();
  }
}
