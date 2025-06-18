class UserResponse {
  final String token;
  final User user;

  UserResponse({required this.token, required this.user});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      token: json['token'] ?? '',
      user: json['user'] != null
          ? User.fromJson(json['user'])
          : User(id: '', email: ''),
    );
  }
}

class User {
  final String id;
  final String email;

  User({required this.id, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
    );
  }
}
