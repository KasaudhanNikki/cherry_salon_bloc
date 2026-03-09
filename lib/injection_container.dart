import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'core/network/dio_client.dart';
import 'core/storage/storage_token.dart';
import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/auth/data/repository_impl/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/domain/usecases/register_usecase.dart';
import 'features/auth/presentation/bloc/login_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Bloc
  sl.registerFactory(() => LoginBloc(loginUseCase: sl(), tokenStorage: sl()));

  sl.registerFactory(
    () => RegisterBloc(registerUseCase: sl(), tokenStorage: sl()),
  );

  /// UseCases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));

  /// Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  /// DataSource
  sl.registerLazySingleton(() => AuthRemoteDataSource(sl()));

  /// Core
  sl.registerLazySingleton(() => TokenStorage());

  sl.registerLazySingleton(() => DioClient(sl()));

  sl.registerLazySingleton<Dio>(() => sl<DioClient>().dio);
}
