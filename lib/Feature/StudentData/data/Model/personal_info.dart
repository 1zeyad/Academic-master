import 'dart:convert';

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

class PersonalInfo {
  final String id;
  final Name name;
  final String gender;
  final String nationalId;
  final String universityId;
  final String email;
  final String phone;
  final String avatar;

  PersonalInfo({
    required this.id,
    required this.name,
    required this.gender,
    required this.nationalId,
    required this.universityId,
    required this.email,
    required this.phone,
    required this.avatar,
  });

  factory PersonalInfo.fromJson(Map<String, dynamic> json) {
    return PersonalInfo(
      id: json['id'],
      name: Name.fromJson(json['name']),
      gender: json['gender'],
      nationalId: json['nationalId'],
      universityId: json['universityId'],
      email: json['email'],
      phone: json['phone'],
      avatar: json['avatar'] ?? '',
    );
  }

 
}
