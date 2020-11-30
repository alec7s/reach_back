class Course {
  String name;
  String desc;
  int start;
  int end;

  Course(this.name, {this.desc, this.start, this.end});

  String getName() => this.name;
}
