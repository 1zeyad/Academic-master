

class PlanModel {
  final int level;
  final int semester;
  final List<Course> courses;

  PlanModel({
    required this.level,
    required this.semester,
    required this.courses,
  });

  factory PlanModel.fromJson(Map<String, dynamic> json) {
    return PlanModel(
      level: json['level'],
      semester: json['semester'],
      courses: (json['courses'] as List)
          .map((course) => Course.fromJson(course))
          .toList(),
    );
  }
}

class Course {
  final String id;
  final String code;
  final CourseName name;
  final int level;
  final int creditHours;
  final int lectureHours;
  final int practicalHours;
  final CoursePrerequisite? prerequisite;

  Course({
    required this.id,
    required this.code,
    required this.name,
    required this.level,
    required this.creditHours,
    required this.lectureHours,
    required this.practicalHours,
    this.prerequisite,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      code: json['code'],
      name: CourseName.fromJson(json['name']),
      level: json['level'],
      creditHours: json['creditHours'],
      lectureHours: json['lectureHours'],
      practicalHours: json['practicalHours'],
      prerequisite: json['prerequisite'] != null
          ? CoursePrerequisite.fromJson(json['prerequisite'])
          : null,
    );
  }
}

class CourseName {
  final String ar;
  final String en;

  CourseName({required this.ar, required this.en});

  factory CourseName.fromJson(Map<String, dynamic> json) {
    return CourseName(
      ar: json['ar'],
      en: json['en'],
    );
  }
}

class CoursePrerequisite {
  final String id;
  final String code;
  final CourseName name;

  CoursePrerequisite({
    required this.id,
    required this.code,
    required this.name,
  });

  factory CoursePrerequisite.fromJson(Map<String, dynamic> json) {
    return CoursePrerequisite(
      id: json['id'],
      code: json['code'],
      name: CourseName.fromJson(json['name']),
    );
  }
}

List<PlanModel> parsePlans(Map<String, dynamic> json) {
  return (json['semesters'] as List)
      .map((e) => PlanModel.fromJson(e))
      .toList();
}
