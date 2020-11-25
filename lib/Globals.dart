library global;

import 'package:flutter/material.dart';

Widget hrzSpacer(double h) {
  return Container(
    width: double.infinity,
    height: h,
  );
}

buttonNav(context, Widget wdg) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => wdg));
}

Widget hrzButton(String label, BuildContext context, {List actions}) {
  return Container(
    width: double.infinity,
    height: 40.0,
    child: RaisedButton(
      color: Theme.of(context).buttonColor,
      disabledColor: Theme.of(context).buttonColor,
      onPressed: () {
        actions.forEach((value) => value);
      },
      child: Text(
        label,
        style: TextStyle(fontSize: 20),
      ),
      textColor: Colors.white,
      disabledTextColor: Colors.white,
    ),
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

Widget formField({String hintTxt, controller, List actions}) {
  return Container(
    color: Colors.white70,
    height: 40.0,
    width: double.infinity,
    child: TextFormField(
      controller: controller,
      onChanged: (text) {
        actions.forEach((value) => value);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      //TODO: REFERENCE THEME COLOR
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        fillColor: Colors.white,
        labelText: hintTxt,
      ),
    ),
  );
}

getFieldValue(final controller, var x) {
  //setState() {
  if (x != null) {
    controller.text = x;
    //}
  }
}
