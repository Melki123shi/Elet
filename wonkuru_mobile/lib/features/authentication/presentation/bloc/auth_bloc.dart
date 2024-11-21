import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:let/features/authentication/domain/entity/user_entity.dart';
import 'package:let/features/authentication/domain/usecases/login_usecase.dart';
import 'package:let/features/authentication/domain/usecases/signup_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignupUsecase signupUsecase;
  final LoginUsecase loginUsecase;
  // final LogOutU signupUsecase;
  AuthBloc( {
    required this.signupUsecase,
    required this.loginUsecase,
  }
  ) : super(AuthInitial()) {
    on<LogOutEvent>(_logOut);
    on<SignUpEvent>(_signUp);
    on<LogInEvent>(_logIn);
  }

  void _logOut(LogOutEvent event, Emitter<AuthState> emit) {}

  void _signUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(SignUpLoadingState());
     final response = await signupUsecase(SignupParams(
      user: event.user
    ));

    response.fold((failure) {
      emit(
        SignUpErrorState(
          errorMessage: failure.properties.toString(),
        ),
      );
    }, (user) {
      emit(SignUpSuccessState(user: user));
    });
  }

  void _logIn(LogInEvent event, Emitter<AuthState> emit) async {
    emit(LogInLoadingState());
    final response = await loginUsecase(LoginParams(
      email: event.email,
      password: event.password,
    ));

    response.fold((failure) {
      emit(
        const UnAuthenticatedState(
          errorMessage: 'Login failure',
        ),
      );
    }, (user) {
      emit(AuthenticatedState(user: user));
    });
  }
}
