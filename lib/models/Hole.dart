import 'Course.dart';

class Hole extends Course {
  String name;
  int number;
  int score1 = 0;
  int score2 = 0;

  Hole(this.name, {this.number}) : super(name);
}
