import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormField extends StatefulWidget {
  final double width;
  final String hintTxt;
  final ValueChanged onChange;
  final TextEditingController controller;
  final TextInputType keyboard;

  const FormField(
      {Key key,
      @required this.width,
      @required this.controller,
      this.keyboard,
      this.hintTxt,
      this.onChange})
      : super(key: key);

  @override
  FormFieldState createState() {
    return FormFieldState();
  }
}

class FormFieldState extends State<FormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      height: 40.0,
      width: widget.width,
      child: SizedBox(
        child: TextFormField(
          keyboardType: widget.keyboard,
          controller: widget.controller,
          onChanged: widget.onChange,
          validator: (value) {
            if (value.isEmpty) {
              return 'Required.';
            }
            return null;
          },
          //TODO: REFERENCE THEME COLOR
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.normal),
          decoration: InputDecoration(
            fillColor: Colors.white,
            labelText: widget.hintTxt,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ),
    );
  }
}
