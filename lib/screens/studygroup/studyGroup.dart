class StudyGroup {
  String subject;
  String level;
  String date;
  String time;
  String building;

  StudyGroup(this.subject, this.level, this.date, this.time, this.building);

  Map<String, dynamic> toJson() => {
        'subject': subject,
        'level': level,
        'date': date,
        'time': time,
        'building': building,
      };
}
