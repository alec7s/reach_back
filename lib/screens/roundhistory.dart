import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundHistory extends StatelessWidget {
  createDataRow() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Theme.of(context).accentColor.withOpacity(0.9),
          title: const Text('Previous Rounds'),
        ),
        body: Column(
            //TODO ADD TABLE THAT DISPLAYS DATA FOR PREVIOUS ROUNDS
            ),
      ),
    );
  }
}
