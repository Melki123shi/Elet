part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class LogInLoadingState extends AuthState {}

final class SignUpLoadingState extends AuthState {}

final class AuthenticatedState extends AuthState {
  final UserEntity user;
  const AuthenticatedState({required this.user});
}

final class UnAuthenticatedState extends AuthState {
  final String errorMessage;
  const UnAuthenticatedState({required this.errorMessage});
}

final class SignUpErrorState extends AuthState {
  final String errorMessage;
  const SignUpErrorState({required this.errorMessage});
}

final class SignUpSuccessState extends AuthState {
  final UserEntity user;
  const SignUpSuccessState({required this.user});
}
