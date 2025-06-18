class AvaliableCourses {
  String id;
  CourseName name;
  String code;
  int lectureHours;
  int practicalHours;
  int creditHours;
  int level;
  Prerequisite ? prerequisite;

  AvaliableCourses({
    required this.id,
    required this.name,
    required this.code,
    required this.lectureHours,
    required this.practicalHours,
    required this.creditHours,
    required this.level,
    this.prerequisite,
  });

  factory AvaliableCourses.fromJson( json) {
    return AvaliableCourses(
      id: json['id'],
      name: CourseName.fromJson(json['name']),
      code: json['code'],
      lectureHours: json['lectureHours'],
      practicalHours: json['practicalHours'],
      creditHours: json['creditHours'],
      level: json['level'] ?? 0,
      prerequisite:json['prerequisite'] != null 
    ? Prerequisite.fromJson(json['prerequisite']) 
    : null, 
    );
  }
}

class CourseName {
  String ar;
  String en;

  CourseName({required this.ar, required this.en});

  factory CourseName.fromJson( json) {
    return CourseName(
      ar: json['ar'],
      en: json['en'],
    );
  }
}

class Prerequisite {
  final String id;
  final Name name;

  Prerequisite({required this.id, required this.name});

  factory Prerequisite.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return Prerequisite(
        id: "null",
        name: Name(ar: "", en: "None prerequisite"),
      );
    }
    
    return Prerequisite(
      id: json['id'] ?? "null",
      name: Name.fromJson(json['name'] ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name.toJson(),
    };
  }
}

class Name {
  final String ar;
  final String en;

  Name({required this.ar, required this.en});

  factory Name.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return Name(ar: "", en: "None prerequisite");
    }
    return Name(
      ar: json['ar'] ,
      en: json['en'] ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ar': ar,
      'en': en,
    };
  }
}

List<AvaliableCourses> parseData(List<dynamic> jsonData) {
  return jsonData.map((e) => AvaliableCourses.fromJson(e)).toList();
}