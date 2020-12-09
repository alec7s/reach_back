import 'package:reach_back/globals.dart' as global;

class Course {
  String name;
  String desc;
  int start;
  int end;
  var _scoreMap;
  var _holeNumbers;
  List<String> scores;

  Course(this.name, this.desc, this.start, this.end) {
    //SET HOLE NUMBERS FOR SCORE CARD USING START/END
    _holeNumbers = [for (var i = start; i <= end; i++) i];
    print('''name: $name\n
    desc: $desc\n
    start: $start\n
    end: $end\n
    hole numbers: ''' +
        _holeNumbers.toString());
  }

  int getHoleNumber(index) => _holeNumbers[index];
  int getHoleNumbersLen() => _holeNumbers.length;

  setScoreMap() {
    Map<int, String> _scoreMap = Map.fromIterables(_holeNumbers, scores);
  }

  String getName() => this.name;
}
