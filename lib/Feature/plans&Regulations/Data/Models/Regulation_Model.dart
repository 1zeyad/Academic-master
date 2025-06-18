class Regulation {
  final String id;
  final Name name;
  final RegistrationRules registrationRules;
  final AcademicRequirements academicRequirements;
  final UniversityRequirements universityRequirements;
  final SpecializationRequirements specializationRequirements;
  final FacultyRequirements facultyRequirements;
  final BasicScienceRequirements basicScienceRequirements;
  final RetakeRules retakeRules;
  final DismissalRules dismissalRules;
  final List<Level> levels;
  final List<CourseGpaRange> courseGpaRanges;
  final List<CumGpaRange> cumGpaRanges;

  Regulation({
    required this.id,
    required this.name,
    required this.registrationRules,
    required this.academicRequirements,
    required this.universityRequirements,
    required this.specializationRequirements,
    required this.facultyRequirements,
    required this.basicScienceRequirements,
    required this.retakeRules,
    required this.dismissalRules,
    required this.levels,
    required this.courseGpaRanges,
    required this.cumGpaRanges,
  });

  factory Regulation.fromJson(Map<String, dynamic> json) {
    return Regulation(
      id: json['id'],
      name: Name.fromJson(json['name']),
      registrationRules: RegistrationRules.fromJson(json['registrationRules']),
      academicRequirements:
          AcademicRequirements.fromJson(json['academicRequirements']),
      universityRequirements:
          UniversityRequirements.fromJson(json['universityRequirements']),
      specializationRequirements: SpecializationRequirements.fromJson(
          json['specializationRequirements']),
      facultyRequirements:
          FacultyRequirements.fromJson(json['facultyRequirements']),
      basicScienceRequirements:
          BasicScienceRequirements.fromJson(json['basicScienceRequirements']),
      retakeRules: RetakeRules.fromJson(json['retakeRules']),
      dismissalRules: DismissalRules.fromJson(json['dismissalRules']),
      levels: (json['levels'] as List).map((e) => Level.fromJson(e)).toList(),
      courseGpaRanges: (json['courseGpaRanges'] as List)
          .map((e) => CourseGpaRange.fromJson(e))
          .toList(),
      cumGpaRanges: (json['cumGpaRanges'] as List)
          .map((e) => CumGpaRange.fromJson(e))
          .toList(),
    );
  }
}

class Name {
  final String en;
  final String ar;

  Name({required this.en, required this.ar});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      en: json['en'],
      ar: json['ar'],
    );
  }
}

class RegistrationRules {
  final int maxRegistrationHours;
  final int normalRegistrationHours;
  final int minRegistrationHours;
  final int gpaForMaxHours;
  final int summerTermHours;

  RegistrationRules({
    required this.maxRegistrationHours,
    required this.normalRegistrationHours,
    required this.minRegistrationHours,
    required this.gpaForMaxHours,
    required this.summerTermHours,
  });

  factory RegistrationRules.fromJson(Map<String, dynamic> json) {
    return RegistrationRules(
      maxRegistrationHours: json['maxRegistrationHours'],
      normalRegistrationHours: json['normalRegistrationHours'],
      minRegistrationHours: json['minRegistrationHours'],
      gpaForMaxHours: json['gpaForMaxHours'],
      summerTermHours: json['summerTermHours'],
    );
  }
}

class AcademicRequirements {
  final int regulationHours;
  final int levelsCount;
  final int semestersWithoutGpaRules;

  AcademicRequirements({
    required this.regulationHours,
    required this.levelsCount,
    required this.semestersWithoutGpaRules,
  });

  factory AcademicRequirements.fromJson(Map<String, dynamic> json) {
    return AcademicRequirements(
      regulationHours: json['regulationHours'],
      levelsCount: json['levelsCount'],
      semestersWithoutGpaRules: json['semestersWithoutGpaRules'],
    );
  }
}

class UniversityRequirements {
  final int mandatoryHours;

  UniversityRequirements({required this.mandatoryHours});

  factory UniversityRequirements.fromJson(Map<String, dynamic> json) {
    return UniversityRequirements(
      mandatoryHours: json['mandatoryHours'],
    );
  }
}

class SpecializationRequirements {
  final int requiredHours;
  final int mandatoryHours;
  final int optionalHours;
  final GradProjectRequirements gradProjectRequirements;
  final TrainingRequirements trainingRequirements;

  SpecializationRequirements({
    required this.requiredHours,
    required this.mandatoryHours,
    required this.optionalHours,
    required this.gradProjectRequirements,
    required this.trainingRequirements,
  });

  factory SpecializationRequirements.fromJson(Map<String, dynamic> json) {
    return SpecializationRequirements(
      requiredHours: json['requiredHours'],
      mandatoryHours: json['mandatoryHours'],
      optionalHours: json['optionalHours'],
      gradProjectRequirements:
          GradProjectRequirements.fromJson(json['gradProjectRequirements']),
      trainingRequirements:
          TrainingRequirements.fromJson(json['trainingRequirements']),
    );
  }
}

class GradProjectRequirements {
  final int requiredHours;
  final int creditHours;

  GradProjectRequirements({
    required this.requiredHours,
    required this.creditHours,
  });

  factory GradProjectRequirements.fromJson(Map<String, dynamic> json) {
    return GradProjectRequirements(
      requiredHours: json['requiredHours'],
      creditHours: json['creditHours'],
    );
  }
}

class TrainingRequirements {
  final int requiredHours;
  final int creditHours;

  TrainingRequirements({
    required this.requiredHours,
    required this.creditHours,
  });

  factory TrainingRequirements.fromJson(Map<String, dynamic> json) {
    return TrainingRequirements(
      requiredHours: json['requiredHours'],
      creditHours: json['creditHours'],
    );
  }
}

class FacultyRequirements {
  final int mandatoryHours;
  final int optionalHours;

  FacultyRequirements({
    required this.mandatoryHours,
    required this.optionalHours,
  });

  factory FacultyRequirements.fromJson(Map<String, dynamic> json) {
    return FacultyRequirements(
      mandatoryHours: json['mandatoryHours'],
      optionalHours: json['optionalHours'],
    );
  }
}

class BasicScienceRequirements {
  final int mandatoryHours;
  final int optionalHours;

  BasicScienceRequirements({
    required this.mandatoryHours,
    required this.optionalHours,
  });

  factory BasicScienceRequirements.fromJson(Map<String, dynamic> json) {
    return BasicScienceRequirements(
      mandatoryHours: json['mandatoryHours'],
      optionalHours: json['optionalHours'],
    );
  }
}

class RetakeRules {
  final int maxRetakeGrade;
  final int maxRetakeCourses;

  RetakeRules({
    required this.maxRetakeGrade,
    required this.maxRetakeCourses,
  });

  factory RetakeRules.fromJson(Map<String, dynamic> json) {
    return RetakeRules(
      maxRetakeGrade: json['maxRetakeGrade'],
      maxRetakeCourses: json['maxRetakeCourses'],
    );
  }
}

class DismissalRules {
  final int maxConsecutiveWarnings;
  final int maxYearsLevelOne;
  final int minGpaForGraduation;

  DismissalRules({
    required this.maxConsecutiveWarnings,
    required this.maxYearsLevelOne,
    required this.minGpaForGraduation,
  });

  factory DismissalRules.fromJson(Map<String, dynamic> json) {
    return DismissalRules(
      maxConsecutiveWarnings: json['maxConsecutiveWarnings'],
      maxYearsLevelOne: json['maxYearsLevelOne'],
      minGpaForGraduation: json['minGpaForGraduation'],
    );
  }
}

class Level {
  final int value;
  final int reqHours;

  Level({
    required this.value,
    required this.reqHours,
  });

  factory Level.fromJson(Map<String, dynamic> json) {
    return Level(
      value: json['value'],
      reqHours: json['reqHours'],
    );
  }
}

class CourseGpaRange {
  final int from;
  final int to;
  final double gpa;
  final String name;

  CourseGpaRange({
    required this.from,
    required this.to,
    required this.gpa,
    required this.name,
  });

  factory CourseGpaRange.fromJson(Map<String, dynamic> json) {
    return CourseGpaRange(
      from: json['from'],
      to: json['to'],
      gpa: json['gpa'].toDouble(),
      name: json['name'],
    );
  }
}

class CumGpaRange {
  final double from;
  final double to;
  final String name;

  CumGpaRange({
    required this.from,
    required this.to,
    required this.name,
  });

  factory CumGpaRange.fromJson(Map<String, dynamic> json) {
    return CumGpaRange(
      from: json['from'].toDouble(),
      to: json['to'].toDouble(),
      name: json['name'],
    );
  }
}

extension RegulationToMap on Regulation {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': {
        'en': name.en,
        'ar': name.ar,
      },
      'registrationRules': {
        'maxRegistrationHours': registrationRules.maxRegistrationHours,
        'normalRegistrationHours': registrationRules.normalRegistrationHours,
        'minRegistrationHours': registrationRules.minRegistrationHours,
        'gpaForMaxHours': registrationRules.gpaForMaxHours,
        'summerTermHours': registrationRules.summerTermHours,
      },
      'academicRequirements': {
        'regulationHours': academicRequirements.regulationHours,
        'levelsCount': academicRequirements.levelsCount,
        'semestersWithoutGpaRules':
            academicRequirements.semestersWithoutGpaRules,
      },
      'universityRequirements': {
        'mandatoryHours': universityRequirements.mandatoryHours,
      },
      'specializationRequirements': {
        'requiredHours': specializationRequirements.requiredHours,
        'mandatoryHours': specializationRequirements.mandatoryHours,
        'optionalHours': specializationRequirements.optionalHours,
        'gradProjectRequirements': {
          'requiredHours':
              specializationRequirements.gradProjectRequirements.requiredHours,
          'creditHours':
              specializationRequirements.gradProjectRequirements.creditHours,
        },
        'trainingRequirements': {
          'requiredHours':
              specializationRequirements.trainingRequirements.requiredHours,
          'creditHours':
              specializationRequirements.trainingRequirements.creditHours,
        },
      },
      'facultyRequirements': {
        'mandatoryHours': facultyRequirements.mandatoryHours,
        'optionalHours': facultyRequirements.optionalHours,
      },
      'basicScienceRequirements': {
        'mandatoryHours': basicScienceRequirements.mandatoryHours,
        'optionalHours': basicScienceRequirements.optionalHours,
      },
      'retakeRules': {
        'maxRetakeGrade': retakeRules.maxRetakeGrade,
        'maxRetakeCourses': retakeRules.maxRetakeCourses,
      },
      'dismissalRules': {
        'maxConsecutiveWarnings': dismissalRules.maxConsecutiveWarnings,
        'maxYearsLevelOne': dismissalRules.maxYearsLevelOne,
        'minGpaForGraduation': dismissalRules.minGpaForGraduation,
      },
      'levels': levels
          .map((e) => {
                'value': e.value,
                'reqHours': e.reqHours,
              })
          .toList(),
      'courseGpaRanges': courseGpaRanges
          .map((e) => {
                'from': e.from,
                'to': e.to,
                'gpa': e.gpa,
                'name': e.name,
              })
          .toList(),
      'cumGpaRanges': cumGpaRanges
          .map((e) => {
                'from': e.from,
                'to': e.to,
                'name': e.name,
              })
          .toList(),
    };
  }
}
