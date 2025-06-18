class AcademicInfo {
  final int attemptedHours;
  final int gainedHours;
  final dynamic gpa;
  final int level;
  final Regulation regulation;

  AcademicInfo({
    required this.attemptedHours,
    required this.gainedHours,
    required this.gpa,
    required this.level,
    required this.regulation,
  });

  factory AcademicInfo.fromJson(Map<String, dynamic> json) {
    return AcademicInfo(
      attemptedHours: json['attemptedHours'],
      gainedHours: json['gainedHours'],
      gpa: json['gpa'],
      level: json['level'],
      regulation: Regulation.fromJson(json['regulation']),
    );
  }
}

class Regulation {
  final String id;
  final Map<String, String> name;
  final AcademicRequirements academicRequirements;
  Regulation({
    required this.id,
    required this.name,
    required this.academicRequirements,
  });

  factory Regulation.fromJson(Map<String, dynamic> json) {
    return Regulation(
      id: json['id'] ?? "",
      name: Map<String, String>.from(json['name']),
      academicRequirements:
          AcademicRequirements.fromJson(json['academicRequirements']),
    );
  }
}

class AcademicRequirements {
  final int regulationHours;

  AcademicRequirements({required this.regulationHours});

  factory AcademicRequirements.fromJson(Map<String, dynamic> json) {
    return AcademicRequirements(
      regulationHours: json['regulationHours'],
    );
  }
}
