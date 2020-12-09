library global;

import 'package:flutter/material.dart';
import 'package:reach_back/screens/scorecard.dart';

//*******************************************
//VARIABLES
var newCourse;
int holeIndex = 0;
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

int setHoleNumber(String direction) {
  if (direction == 'next') {
    if (holeIndex + 1 <= newCourse.getHoleNumbersLen()) {
      holeIndex++;
      return newCourse.getHoleNumber(holeIndex);
    }
  }
  if (direction == 'back') {
    if ((holeIndex - 1) > 0) {
      holeIndex--;
      return newCourse.getHoleNumber(holeIndex);
    }
  }
  return newCourse.getHoleNumber(holeIndex);
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
