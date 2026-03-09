import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_logger.dart';
import '../../domain/usecases/login_usecase.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());

      try {
        final user = await loginUseCase(event.email, event.password);
        emit(LoginSuccess(user));
      } catch (e) {
        emit(LoginError(e.toString()));
        AppLogger.error("Error--->${e.toString()}");
      }
    });
  }

}
