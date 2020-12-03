import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Globals.dart' as global;
import 'package:reach_back/screens/CourseForm.dart';

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
