import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reach_back/components/roundmatrix.dart';

class RoundHistory extends StatelessWidget {
  List<Map<String, dynamic>> data;
  RoundHistory(this.data);

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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RoundMatrix(data),
            ],
          ),
        ),
      ),
    );
  }
}
