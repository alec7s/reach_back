class Course {
  String name;
  String desc;
  int start;
  int end;
  //var _scoreMap;
  var _holeNumbers;
  var _scores;

  Course(this.name, this.start, this.end) {
    //SET HOLE NUMBERS FOR SCORE CARD USING START/END
    _holeNumbers = [for (var i = this.start; i <= this.end; i++) i];
    _scores = [for (var i = 0; i < (this._holeNumbers.length); i++) 0];
    //setScoreMap();
    print(
      ''' name: $name
    desc: $desc
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
