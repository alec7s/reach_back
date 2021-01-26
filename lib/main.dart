import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:ReachBack/theme/style.dart';
import 'package:ReachBack/screens/homepage.dart';

void main() async {
  runApp(ReachBackApp());
}

class ReachBackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        title: 'ReachBack',
        theme: appTheme(),
        home: HomePage(title: 'ReachBack'),
      ),
    );
  }
}
