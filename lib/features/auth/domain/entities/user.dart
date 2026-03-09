class User {
  final String accessToken;
  final String refreshToken;
  final int id;
  final String username;
  final String email;
  final String phoneNumber;
  final String password;
  final String image;

  User({
    required this.accessToken,
    required this.refreshToken,
    required this.id,
    required this.username,
    required this.email,
    required this.image,
    required this.phoneNumber,
    required this.password,
  });
}
