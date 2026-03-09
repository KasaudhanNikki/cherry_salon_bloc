import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_logger.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());

      try {
        final user = await loginUseCase(event.email, event.password);
        emit(Success(user));
      } catch (e) {
        emit(Error(e.toString()));
        AppLogger.error("Error--->${e.toString()}");
      }
    });
  }
}

class RegisterBloc extends Bloc<RegisterEvent, LoginState> {
  final RegisterUseCase registerUseCase;

  RegisterBloc({required this.registerUseCase}) : super(LoginInitial()) {
    on<RegisterSubmitted>((event, emit) async {
      emit(LoginLoading());

      try {
        final user = await registerUseCase(
          username: event.username,
          email: event.email,
          password: event.password,
          phone: event.phone,
        );

        emit(Success(user));
      } catch (e) {
        emit(Error(e.toString()));
      }
    });
  }
}
