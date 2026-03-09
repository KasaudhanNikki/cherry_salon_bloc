abstract class LoginEvent {}

class LoginSubmitted extends LoginEvent {
  final String email;
  final String password;

  LoginSubmitted({required this.email, required this.password});
}

abstract class RegisterEvent {}

class RegisterSubmitted extends RegisterEvent {
  final String username;
  final String email;
  final String password;
  final String phone;

  RegisterSubmitted({
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
  });
}
