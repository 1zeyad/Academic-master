
class TermGrades {
  final String id;
  final int startYear;
  final int endYear;
  final int semester;
  final int gainedHours;
  final int totalHours;
  final double gpa;
  final double cumGpa;
  final List<Course> courses;

  TermGrades({
    required this.id,
    required this.startYear,
    required this.endYear,
    required this.semester,
    required this.gainedHours,
    required this.totalHours,
    required this.gpa,
    required this.cumGpa,
    required this.courses,
  });

  factory TermGrades.fromJson(Map<String, dynamic> json) {
    return TermGrades(
      id: json['id'],
      startYear: json['startYear'],
      endYear: json['endYear'],
      semester: json['semester'],
      gainedHours: json['statistics']['gainedHours'],
      totalHours: json['statistics']['attemptedHours'],
      gpa: (json['statistics']['gpa'] as num).toDouble(),
      cumGpa: (json['statistics']['cumGpa'] as num).toDouble(),
      courses: (json['semesterCourses'] as List)
          .map((e) => Course.fromJson(e))
          .toList(),
    );
  }
}

class Course {
  final String courseId;
  final String nameEn;
  final String nameAr;
  final String code;
  final int creditHours;
  final int degree;
  final String? grade;
  final double gpa;

  Course({
    required this.courseId,
    required this.nameEn,
    required this.nameAr,
    required this.code,
    required this.creditHours,
    required this.degree,
    required this.grade,
    required this.gpa,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      courseId: json['course']['id'],
      nameEn: json['course']['name']['en'],
      nameAr: json['course']['name']['ar'],
      code: json['course']['code'],
      creditHours: json['course']['creditHours'],
      degree: json['performance']['degree'],
      grade: json['performance']['grade'] ?? '',
      gpa: (json['performance']['gpa'] as num).toDouble(),
    );
  }
}

List<TermGrades> parseSemesters(List<dynamic> jsonData) {
  return jsonData.map((e) => TermGrades.fromJson(e)).toList();
}
