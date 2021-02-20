import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ReachBack/screens/courseform.dart';
import 'package:ReachBack/components/WideButton.dart';
import 'package:ReachBack/globals.dart' as global;
import 'package:ReachBack/screens/roundhistory.dart';
import 'package:ReachBack/db/database_helper.dart';

//HOME SCREEN -- LANDING SCREEN WHEN APP IS OPENED
//DISPLAY NEW ROUND AND BEAT YOUR SCORE BUTTONS BELOW APP ICON
class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              //DISPLAY APP ICON
              Container(
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.height * 0.29,
                  backgroundImage: AssetImage('images/ReachBackLogo.png'),
                ),
              ),
              //SPACER FOR FORMATTING
              SizedBox(height: 40.0),
              //NEW ROUND BUTTON. MOVE TO COURSEFORM SCREEN WHEN PRESSED
              WideButton(
                'New round',
                //ON PRESS
                () {
                  global.buttonNav(context, () => CourseForm());
                },
              ),
              //SPACER FOR FORMATTING
              SizedBox(height: 40.0),
              //BEAT YOUR SCORE BUTTON.
              // EXTRACT ALL ROUND RECORDS FROM DB AND MOVE TO ROUNDHISTORY
              // SCREEN WHEN PRESSED
              WideButton(
                'Beat your score',
                //ON PRESS
                () async {
                  List<Map<String, dynamic>> data =
                      await DatabaseHelper.instance.queryAll();
                  if (data != null) print('data extracted');
                  print(data);
                  global.buttonNav(
                    context,
                    () => RoundHistory(data),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
