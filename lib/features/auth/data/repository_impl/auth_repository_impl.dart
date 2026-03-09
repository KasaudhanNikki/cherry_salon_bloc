import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<User> login(String email, String password) async {
    final userModel = await remoteDataSource.login(email, password);

    return User(
      accessToken: userModel.accessToken ?? "",
      refreshToken: userModel.refreshToken ?? "",
      id: userModel.id ?? 0,
      username: userModel.username ?? "",
      email: userModel.email ?? "",
      image: userModel.image ?? "",
      password: userModel.password ?? "",
      phoneNumber: userModel.phoneNumber ?? "",
    );
  }

  @override
  Future<User> register({
    required String username,
    required String email,
    required String password,
    required String phone,
  }) async {

    final userModel = await remoteDataSource.register(
      username: username,
      email: email,
      password: password,
      phone: phone
    );

    return User(
      accessToken: userModel.accessToken ?? "",
      refreshToken: userModel.refreshToken ?? "",
      id: userModel.id ?? 0,
      username: userModel.username ?? "",
      email: userModel.email ?? "",
      image: userModel.image ?? "",
      password: userModel.password ?? "",
      phoneNumber: userModel.phoneNumber ?? "",
    );
  }

}
