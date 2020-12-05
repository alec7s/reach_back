library global;

import 'package:flutter/material.dart';

//*******************************************
//VARIABLES
var newCourse;
int holeNumber;
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

setHoleNumber() {
  if (holeNumber == null) {
    holeNumber = newCourse.start;
    print('Starting hole: $holeNumber');
  } else {
    if (holeNumber <= newCourse.end) {
      holeNumber++;
      print('Next hole: $holeNumber');
    }
  }
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
