import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/dio_client.dart';
import '../models/user_model.dart';
import '../../../../core/utils/app_logger.dart';

class AuthRemoteDataSource {
  final DioClient client;

  AuthRemoteDataSource(this.client);

  Future<UserModel> login(String email, String password) async {
    try {
      final response = await client.dio.post(
        "/auth/login",
        data: {"username": email, "password": password, "expiresInMins": 30},
      );

      AppLogger.info("Status Code: ${response.statusCode}");
      AppLogger.info("Response Data: ${response.data}");

      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        return UserModel.fromJson(response.data);
      } else if (response.statusCode == 401) {
        throw InvalidCredentialsException("Invalid email or password");
      } else {
        throw ServerException("Server returned ${response.statusCode}");
      }
    } catch (e) {
      if (e is DioException) {
        throw NetworkException(e.message ?? "Network error");
      }
      rethrow;
    }
  }

}
