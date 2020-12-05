import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WideButton extends StatelessWidget {
  final String label;
  final VoidCallback onPress;

  WideButton(this.label, this.onPress);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40.0,
      child: RaisedButton(
        color: Theme.of(context).buttonColor,
        disabledColor: Theme.of(context).buttonColor,
        textColor: Colors.white,
        child: Text(
          label,
          style: TextStyle(fontSize: 20),
        ),
        onPressed: onPress,
      ),
    );
  }
}
