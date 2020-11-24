library global;

import 'package:flutter/material.dart';

Widget hrzSpacer(double h) {
  return Container(
    width: double.infinity,
    height: h,
  );
}

Widget hrzButton(String label, BuildContext context, {Widget nav}) {
  return Container(
    width: double.infinity,
    height: 40.0,
    child: RaisedButton(
      color: Theme.of(context).buttonColor,
      disabledColor: Theme.of(context).buttonColor,
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => nav,
          ),
        );
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

Widget formField({String hintTxt}) {
  return Container(
    color: Colors.white70,
    height: 40.0,
    width: double.infinity,
    child: TextFormField(
      //TODO: REFERENCE THEME COLOR
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        fillColor: Colors.white,
        labelText: hintTxt,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    ),
  );
}
