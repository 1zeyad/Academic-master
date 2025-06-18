
class WarningModel {
  final String id;
  final double gpa;
  final Semester semester;

  WarningModel({
    required this.id,
    required this.gpa,
    required this.semester,
  });
   
  factory WarningModel.fromJson(Map<String, dynamic> json) {
    return WarningModel(
      id: json['id'],
      gpa: json['gpa'].toDouble(),
      semester: Semester.fromJson(json['semester']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'gpa': gpa,
      'semester': semester.toJson(),
    };
  }
    static List<WarningModel> parseWarningsModel(List<dynamic> jsonData) {
  return jsonData.map((e) => WarningModel.fromJson(e)).toList();
}
}

class Semester {
  final int startYear;
  final int endYear;
  final int semester;

  Semester({
    required this.startYear,
    required this.endYear,
    required this.semester,
  });

  factory Semester.fromJson(Map<String, dynamic> json) {
    return Semester(
      startYear: json['startYear'],
      endYear: json['endYear'],
      semester: json['semester'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'startYear': startYear,
      'endYear': endYear,
      'semester': semester,
    };
  }

}

