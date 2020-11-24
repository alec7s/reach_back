import 'package:flutter/material.dart';
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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int holeCount = 0;
  List<Hole> holesPlayed = [];
  void incHole() {
    setState(() {
      holeCount++;
    });
  }

  //HOME SCREEN -- LANDING SCREEN WHEN APP IS OPENED
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset('images/ReachBackLogo.png'),
              ),
              global.hrzSpacer(40.0),
              global.hrzButton('New Round', context, nav: CourseForm()),
              global.hrzSpacer(40.0),
              global.hrzButton('Continue Previous Round', context)
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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Theme.of(context).accentColor,
          title: const Text('Course Information'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              global.hrzSpacer(40.0),
              global.fieldLabel('Course Name:'),
              global.formField(),
              global.hrzSpacer(45.0),
              global.fieldLabel('Description:'),
              global.formField(hintTxt: "Weather, how you're feeling, etc..."),
              global.hrzSpacer(45.0),
              //TODO: PUT FIELD AND LABEL ON SAME LINE
              global.fieldLabel('Starting Hole:'),
              global.formField(),
              global.hrzSpacer(45.0),
              //TODO: PUT FIELD AND LABEL ON SAME LINE
              global.fieldLabel('Ending Hole:'),
              global.formField(),
              global.hrzSpacer(30.0),
              global.hrzButton('Start Round', context),
            ],
          ),
        ),
      ),
    );
  }
}
