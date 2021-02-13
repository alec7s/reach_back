class Round {
  int id;
  String name;
  int start;
  int end;
  var holeNumbers;
  var scores;
  DateTime now;
  String dateYmd;
  int finalScore = 0;
  String nameConcat;
  String holesString;
  String scoresString;
  String roundType;

  Round(this.name, this.start, this.end,
      {this.id, this.finalScore, this.dateYmd, this.roundType}) {
    //FIND DATE/TIME
    now = new DateTime.now();
    //FORMAT DATE AS STRING
    dateYmd =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    holeNumbers = [for (var i = this.start; i <= this.end; i++) i];
    //CREATE LIST TO HOLD SCORES FOR EACH HOLE. STARTING SCORE = 0.
    scores = [for (var i = 0; i < (this.holeNumbers.length); i++) 0];
    //CREATE FORMATTED COURSE NAME WITH STARTING/ENDING HOLE NUMBERS
    if (roundType != "replay") {
      nameConcat = name + ' (#' + start.toString() + '-' + end.toString() + ')';
      name = nameConcat;
    }
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

  setScore(int index, int score) {
    scores[index] = score;

    print('score: $score');
    print('Saved score (' +
        scores[index].toString() +
        ') for hole #' +
        holeNumbers[index].toString());
  }

  setFinalScore() => finalScore = scores.reduce((int a, int b) => a + b);

  setListStrings() {
    holesString = holeNumbers.join(',');
    scoresString = scores.join(',');
  }
}
