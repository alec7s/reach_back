import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reach_back/Globals.dart' as global;
import 'package:reach_back/models/Course.dart';
import 'package:reach_back/main.dart';
import 'package:reach_back/screens/ScoreCard.dart';

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
