import 'dart:math';

import 'package:reach_back/db/db.dart';

class Round {
  int id;
  String name;
  int start;
  int end;
  //var _scoreMap;
  var _holeNumbers;
  var _scores;
  Random random = new Random();

  Round(this.name, this.start, this.end) {
    _holeNumbers = [for (var i = this.start; i <= this.end; i++) i];
    _scores = [for (var i = 0; i < (this._holeNumbers.length); i++) 0];
    //setScoreMap();
    print(
      ''' name: $name
    start: $start
    end: $end
    hole numbers: ''' +
          _holeNumbers.toString() +
          '\n' +
          'scores: ' +
          _scores.toString() +
          '\n' +
          'hole #: ' +
          start.toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'start': start,
      'end': end,
      'holes': _holeNumbers,
      'scores': _scores
    };
  }

  //GETTERS
  int getStartHole() => start;
  int getEndHole() => end;
  int getHoleNumber(index) => _holeNumbers[index];
  int getHoleNumbersLen() => _holeNumbers.length;
  String getName() => this.name;
  int getScore(int index) => _scores[index];
  List<int> getScoreList() => _scores;
  List<int> getHoleNumList() => _holeNumbers;

  //SETTERS
  //setScoreMap() {
  //Map<int, int> _scoreMap = Map.fromIterables(_holeNumbers, _scores);
  //}

  setScore(int index, int score) {
    _scores[index - 1] = score;

    print('score: $score');
    print('Saved score (' +
        _scores[index - 1].toString() +
        ') for hole #' +
        _holeNumbers[index - 1].toString());
  }
}
