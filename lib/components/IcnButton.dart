import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IcnButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final VoidCallback onPress;
  IcnButton(this.icon, this.size, this.onPress);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      alignment: Alignment.center,
      icon: Icon(
        icon,
        color: Colors.white70.withOpacity(0.5),
        size: size,
      ),
      onPressed: onPress,
    );
  }
}
