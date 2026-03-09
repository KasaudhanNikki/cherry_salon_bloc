import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<User> call({
    required String username,
    required String email,
    required String password,
    required String phone
  }) {
    return repository.register(
      username: username,
      email: email,
      password: password,
      phone: phone
    );
  }

}