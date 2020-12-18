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
          'CREATE TABLE rounds(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
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

    return List.generate(maps.length, (i){
      return Round(
        id: maps[i]['id'],
        name: maps[i]['name'],
        start: maps[i]['start'],
        end: maps[i]['end'],
        holes: maps[i]['holes'],
        scores: maps[i]['scores'],
      )
    },)
  }
}
