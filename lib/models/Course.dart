import 'dart:collection';

import 'package:reach_back/globals.dart' as global;

class Course {
  String name;
  String desc;
  int start;
  int end;
  var _scoreMap;
  var _holeNumbers;
  var _scores;

  Course(this.name, this.desc, this.start, this.end) {
    //SET HOLE NUMBERS FOR SCORE CARD USING START/END
    _holeNumbers = [for (var i = start; i <= end; i++) i];
    _scores = [for (var i = 0; i < _holeNumbers.length; i++) 0];
    setScoreMap();
    print(
      '''name: $name\n
    desc: $desc\n
    start: $start\n
    end: $end\n
    hole numbers: ''' +
          _holeNumbers.toString() +
          '\n' +
          'scores: ' +
          _scores.toString(),
    );
  }
  //GETTERS
  int getStartHole() => _holeNumbers[0];
  int getEndHole() => _holeNumbers[_holeNumbers.length - 1];
  int getHoleNumber(index) => _holeNumbers[index];
  int getHoleNumbersLen() => _holeNumbers.length;
  String getName() => this.name;
  int getScore(int key) {
    return _scoreMap[key];
  }

  //SETTERS
  setScoreMap() {
    LinkedHashMap<int, int> _scoreMap =
        Map.fromIterables(_holeNumbers, _scores);
  }

  setScore(int holeNum, int score) {
    _scoreMap.value[holeNum] = score;
    print(_scoreMap.toString());
  }
}
