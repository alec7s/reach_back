import 'package:flutter/material.dart';
import 'Hole.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReachBack',
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
              Container(height: 40.0),
              Container(
                width: double.infinity,
                height: 40.0,
                child: RaisedButton(
                  color: Theme.of(context).buttonColor,
                  disabledColor: Theme.of(context).buttonColor,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CourseForm()));
                  },
                  child: Center(
                    child: Text(
                      'New Round',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  textColor: Colors.white,
                  disabledTextColor: Colors.white,
                ),
              ),
              Container(height: 40.0),
              Container(
                width: double.infinity,
                height: 40.0,
                child: RaisedButton(
                  color: Theme.of(context).buttonColor,
                  disabledColor: Theme.of(context).buttonColor,
                  onPressed: null,
                  child: Text(
                    'Continue Previous Round',
                    style: TextStyle(fontSize: 20),
                  ),
                  textColor: Colors.white,
                  disabledTextColor: Colors.white,
                ),
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

//NEW COURSE SCREEN
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
              Container(
                height: 40,
              ),
              Container(
                child: Text(
                  'Course Name:',
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
              ),
              Container(
                color: Colors.white70,
                height: 40.0,
                width: double.infinity,
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    //labelText: 'Course Name:',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                height: 45,
              ),
              Container(
                child: Text(
                  'Description:',
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
              ),
              Container(
                color: Colors.white70,
                height: 40.0,
                width: double.infinity,
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    hintText: " Weather, how you're feeling, etc...",
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                height: 45,
              ),
              //TODO: PUT FIELD AND LABEL ON SAME LINE
              Container(
                child: Text(
                  'Starting Hole:',
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
              ),
              Container(
                color: Colors.white70,
                height: 40.0,
                width: double.infinity,
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                height: 45,
              ),
              //TODO: PUT FIELD AND LABEL ON SAME LINE
              Container(
                child: Text(
                  'Ending Hole:',
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
              ),
              Container(
                color: Colors.white70,
                height: 40.0,
                width: double.infinity,
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                width: double.infinity,
                height: 30,
              ),
              Container(
                  width: double.infinity,
                  height: 40.0,
                  child: RaisedButton(
                    color: Theme.of(context).buttonColor,
                    disabledColor: Theme.of(context).buttonColor,
                    onPressed: null,
                    child: Text(
                      'Start Round',
                      style: TextStyle(fontSize: 20),
                    ),
                    textColor: Colors.white,
                    disabledTextColor: Colors.white,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
