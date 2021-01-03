import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:reach_back/theme/style.dart';
import 'package:reach_back/screens/homepage.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:reach_back/models/Round.dart';

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
