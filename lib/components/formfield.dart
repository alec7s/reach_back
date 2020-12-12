import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CourseFormField extends StatelessWidget {
  final double width;
  final TextEditingController controller;
  final ValueChanged onChange;
  String hintTxt;
  TextInputType keyboard;

  CourseFormField(this.width, this.controller,
      {this.keyboard, this.hintTxt, this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      height: 40.0,
      width: width,
      child: SizedBox(
        child: TextFormField(
          keyboardType: keyboard,
          controller: controller,
          onChanged: onChange,
          validator: (value) {
            if (value.isEmpty) {
              return 'Required.';
            }
            return null;
          },
          //TODO: REFERENCE THEME COLOR
          style: TextStyle(
              color: Colors.black,
              fontSize: 25.0,
              fontWeight: FontWeight.normal),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5.0),
            fillColor: Colors.white,
            labelText: hintTxt,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ),
    );
  }
}
