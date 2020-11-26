library global;

import 'package:flutter/material.dart';

Widget hrzSpacer(double h) {
  return Container(
    width: double.infinity,
    height: h,
  );
}

buttonNav(context, Widget Function() createPage) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
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

Widget formField({String hintTxt, controller, focusNode, List actions}) {
  return Container(
    color: Colors.white70,
    height: 40.0,
    width: double.infinity,
    child: SizedBox(
      child: TextFormField(
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
        ),
      ),
    ),
  );
}

getFieldValue(final controller, var x) {
  //setState() {
  if (controller.text != null) {
    x = controller.text;
    //}
  }
}
