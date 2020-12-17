import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:reach_back/theme/style.dart';
import 'package:reach_back/screens/homepage.dart';

void main() {
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
