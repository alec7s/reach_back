class Course {
  String name;
  String desc;
  int start;
  int end;
  var _scoreMap;
  List<int> holeNumbers;
  List<String> scores;

  Course(this.name, {this.desc, this.start, this.end});

  setScoreMap() {
    Map<int, String> _scoreMap = Map.fromIterables(holeNumbers, scores);
  }

  String getName() => this.name;
}
