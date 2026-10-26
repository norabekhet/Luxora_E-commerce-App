class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String? accessToken;
  final String? refreshToken;
  final String? expiresAtUtc;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.accessToken,
    this.refreshToken,
    this.expiresAtUtc,
  });

  factory UserModel.fromjson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName'] ?? "",
      lastName: json['lastName'] ?? "",
      email: json['email'] ?? "",
      accessToken: json['accessToken'] ?? "",
      refreshToken: json['refreshToken'] ?? "",
      expiresAtUtc: json['expiresAtUtc'] ?? "",
    );
  }
}
