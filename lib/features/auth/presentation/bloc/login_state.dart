import '../../domain/entities/user.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class Success extends LoginState {
  final User user;

  Success(this.user);
}

class Error extends LoginState {
  final String message;

  Error(this.message);
}
