import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reach_back/screens/courseform.dart';
import 'package:reach_back/components/WideButton.dart';
import 'package:reach_back/globals.dart' as global;

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              SizedBox(height: 40.0),
              WideButton(
                'New round',
                () {
                  global.buttonNav(context, () => CourseForm());
                },
              ),
              SizedBox(height: 40.0),
              WideButton(
                'Beat your score',
                () {},
              ),
              SizedBox(height: 40.0),
              WideButton(
                'View previous rounds',
                () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
