library global;

import 'package:overlay_support/overlay_support.dart';
import 'package:flutter/material.dart';

//*******************************************
//VARIABLES
var newCourse;
var selectedRound;

//*******************************************
//FUNCTIONS
buttonNav(context, Widget Function() createPage) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    print('Create new page');
    return createPage();
  }));
}

getFieldValue(final controller, var x) {
  if (controller.text != null) {
    controller.text = x;
  }
}

double flexHeight(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.1;
}

//*******************************************
//WIDGETS
Widget fieldLabel(String labelTxt) {
  return Container(
    child: Text(
      labelTxt,
      style: TextStyle(fontSize: 35, color: Colors.white),
    ),
  );
}

OverlaySupportEntry constraintNotifier(String msgText) {
  return showSimpleNotification(
    Text(
      msgText,
      style: TextStyle(
        fontSize: 25.0,
        color: Colors.redAccent,
      ),
    ),
    background: Colors.black,
  );
}
