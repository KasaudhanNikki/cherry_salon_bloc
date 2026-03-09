import '../entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);

  Future<User> register({
    required String username,
    required String email,
    required String password,
    required String phone,
  });

}
