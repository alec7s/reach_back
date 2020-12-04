import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  List<TextEditingController> _fldControllers;
  String courseName;
  String description;
  int startHole;
  int endHole;

  //FUNCTIONS
  createCourse(nav, List controllers) {
    if (_formKey.currentState.validate()) {
      print('Form Validated');
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
    _fldControllers = List<TextEditingController>.generate(
      4,
      (index) => TextEditingController(),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    for (var i = 0; i <= _fldControllers.length; i++) {
      _fldControllers[i].dispose();
    }
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
                    FormField(
                        width: double.infinity, controller: _fldControllers[0]),
                    global.vrtSpacer(45.0),
                    global.fieldLabel('Description:'),
                    formField(
                        hintTxt: "Weather, how you're feeling, etc...",
                        controller: _fldControllers[1],
                        focusNode: formFocusNode,
                        actions: global.getFieldValue(
                            _fldControllers[1], description),
                        width: double.infinity),
                    global.vrtSpacer(45.0),
                    //vrtSpacerHOLE FIELD
                    //TODO: PUT FIELD AND LABEL ON SAME LINE
                    global.fieldLabel('Starting Hole:'),
                    formField(
                        keyboard: TextInputType.number,
                        controller: _fldControllers[2],
                        focusNode: formFocusNode,
                        actions:
                            global.getFieldValue(_fldControllers[2], startHole),
                        width: double.infinity),
                    global.vrtSpacer(45.0),
                    //vrtSpacerLE FIELD
                    //TODO: PUT FIELD AND LABEL ON SAME LINE
                    global.fieldLabel('Ending Hole:'),
                    formField(
                        keyboard: TextInputType.number,
                        controller: _fldControllers[3],
                        focusNode: formFocusNode,
                        actions:
                            global.getFieldValue(_fldControllers[3], endHole),
                        width: double.infinity),
                    global.vrtSpacer(45.0),
                    //vrtSpacerND AND CREATE NEW COURSE
                    WideButton(
                      'Start Round',
                      () {
                        createCourse(ScoreCard(), _fldControllers);
                        global.setHoleNumber();
                      },
                    ),
                    global.vrtSpacer(
                      global.flexHeight(context),
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
