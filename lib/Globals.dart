library global;

import 'package:flutter/material.dart';

var newCourse;

Widget hrzSpacer(double h) {
  return Container(
    width: double.infinity,
    height: h,
  );
}

buttonNav(context, Widget Function() createPage) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    print('Create new page');
    return createPage();
  }));
}

Widget fieldLabel(String labelTxt) {
  return Container(
    child: Text(
      labelTxt,
      style: TextStyle(fontSize: 35, color: Colors.white),
    ),
  );
}

Widget formField(
    {String hintTxt,
    controller,
    focusNode,
    List actions,
    double width,
    keyboard}) {
  return Container(
    color: Colors.white70,
    height: 40.0,
    width: width,
    child: SizedBox(
      child: TextFormField(
        keyboardType: keyboard,
        controller: controller,
        onTap: () => focusNode.requestFocus(),
        onChanged: (text) {
          actions.forEach((value) => value);
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Required.';
          }
          return null;
        },
        //TODO: REFERENCE THEME COLOR
        style: TextStyle(
            color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.normal),
        decoration: InputDecoration(
          fillColor: Colors.white,
          labelText: hintTxt,
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
      ),
    ),
  );
}

getFieldValue(final controller, var x) {
  if (controller.text != null) {
    controller.text = x;
  }
}

double flexHeight(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.6;
}
