library global;

import 'package:flutter/material.dart';

//*******************************************
//VARIABLES
var newCourse;

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
  return MediaQuery.of(context).size.height * 0.6;
}

//*******************************************
//WIDGETS
Widget vrtSpacer(double h) {
  return Container(
    width: double.infinity,
    height: h,
  );
}

Widget fieldLabel(String labelTxt) {
  return Container(
    child: Text(
      labelTxt,
      style: TextStyle(fontSize: 35, color: Colors.white),
    ),
  );
}
