import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:reach_back/models/Round.dart';

class Db {
  Future<Database> database;

  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    database = openDatabase(
      join(await getDatabasesPath(), 'round.db'),
      onCreate: (db, version) {
        return db.execute(
          //TODO: ADD REMAINING COLUMNS
          //TODO: FIND WAY TO UPLOAD LIST INTO DB? PERHAPS SECOND TABLE IS NEEDED
          'CREATE TABLE rounds(id INTEGER PRIMARY KEY, dateYmd TEXT, name TEXT, start INTEGER, end INTEGER, finalScore INTEGER)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertRound(Round round) async {
    final Database db = await database;
    await db.insert('rounds', round.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Round>> rounds() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('rounds');

    return List.generate(
      maps.length,
      (i) {
        return Round(
            //TODO: ENSURE CORRECT DATA ITEMS ARE RETURNED (CURRENTLY INCOMPLETE)
            maps[i]['name'],
            maps[i]['start'],
            maps[i]['end'],
            id: maps[i]['id'],
            finalScore: maps[i]['finalScore']);
      },
    );
  }
}
