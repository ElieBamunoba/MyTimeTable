class UnitModel {
  String? courseCode;
  String? date;
  String? time;
  String? venue;

  UnitModel(
      {required this.courseCode,
      required this.date,
      required this.time,
      required this.venue});

  UnitModel.fromJson(Map<String, dynamic> json) {
    courseCode = json['course_code'];
    date = json['day'];
    time = json['time'];
    venue = json['room'];
  }
  Map<String, dynamic> toJson() => {
        'course_code': courseCode,
        'day': date,
        'time': time,
        'room': venue,
      };
}
