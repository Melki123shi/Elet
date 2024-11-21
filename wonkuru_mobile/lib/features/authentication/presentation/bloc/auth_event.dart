part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LogInEvent extends AuthEvent {
  final String email;
  final String password;

  const LogInEvent({
    required this.email,
    required this.password,
  });
}

class SignUpEvent extends AuthEvent {
  final UserEntity user;

  const SignUpEvent({
    required this.user,
   
  });
}

class LogOutEvent extends AuthEvent {}
