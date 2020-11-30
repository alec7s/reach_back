import 'Course.dart';

class Hole extends Course {
  String name;

  int number;
  int score1;
  int score2;

  Hole(this.name, {this.number}) : super(name);
}
