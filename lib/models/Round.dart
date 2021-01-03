import 'dart:math';
import 'dart:convert';

Round roundFromJson(String str) => Round.fromJson(json.decode(str));
String userToJson(Round data) => json.encode(data.toJson());

class Round {
  int id;
  String name;
  int start;
  int end;
  //var _scoreMap;
  var holeNumbers;
  var scores;
  DateTime now;
  String dateYmd;
  int finalScore = 0;

  Round(this.name, this.start, this.end,
      {this.id, this.finalScore, this.dateYmd}) {
    now = new DateTime.now();
    dateYmd =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    holeNumbers = [for (var i = this.start; i <= this.end; i++) i];
    scores = [for (var i = 0; i < (this.holeNumbers.length); i++) 0];
    //setScoreMap();
    print(
      '''
    date: $dateYmd, 
    name: $name
    start: $start
    end: $end
    hole numbers: ''' +
          holeNumbers.toString() +
          '\n' +
          'scores: ' +
          scores.toString() +
          '\n' +
          'hole #: ' +
          start.toString(),
    );
  }

  factory Round.fromJson(Map<String, dynamic> json) => Round(
        json['name'],
        json['start'],
        json['end'],
        id: json['id'],
        finalScore: json['finalScore'],
        dateYmd: json['dateYmd'],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dateYmd': dateYmd,
      'name': name,
      'start': start,
      'end': end,
      'finalScore': finalScore
    };
  }

  //GETTERS
  int getStartHole() => start;
  int getEndHole() => end;
  int getHoleNumber(index) => holeNumbers[index];
  int getHoleNumbersLen() => holeNumbers.length;
  String getName() => this.name;
  int getScore(int index) => scores[index];
  List<int> getScoreList() => scores;
  List<int> getHoleNumList() => holeNumbers;
  getFinalScore() => finalScore;

  //SETTERS
  //setScoreMap() {
  //Map<int, int> _scoreMap = Map.fromIterables(_holeNumbers, _scores);
  //}

  setScore(int index, int score) {
    scores[index - 1] = score;

    print('score: $score');
    print('Saved score (' +
        scores[index - 1].toString() +
        ') for hole #' +
        holeNumbers[index - 1].toString());
  }

  setFinalScore() => finalScore = scores.reduce((int a, int b) => a + b);
}
