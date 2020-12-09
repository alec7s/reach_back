import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IcnButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final VoidCallback onPress;
  final Color color;
  IcnButton(this.icon, this.size, this.color, this.onPress);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      alignment: Alignment.center,
      icon: Icon(
        icon,
        color: color,
        size: size,
      ),
      onPressed: onPress,
    );
  }
}
