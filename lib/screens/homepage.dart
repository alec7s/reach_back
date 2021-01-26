import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ReachBack/screens/courseform.dart';
import 'package:ReachBack/components/WideButton.dart';
import 'package:ReachBack/globals.dart' as global;
import 'package:ReachBack/screens/roundhistory.dart';
import 'package:ReachBack/db/database_helper.dart';

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
                //ON PRESS
                () {
                  global.buttonNav(context, () => CourseForm());
                },
              ),
              SizedBox(height: 40.0),
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
