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
      firstName: userModel.firstName ?? "",
      lastName: userModel.lastName ?? "",
      gender: userModel.gender ?? "",
      image: userModel.image ?? "",
    );
  }

}
