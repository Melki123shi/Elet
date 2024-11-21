import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:let/core/error/failure.dart';
import 'package:let/core/usecases/usecases.dart';
import 'package:let/features/authentication/domain/entity/user_entity.dart';
import 'package:let/features/authentication/domain/repository/auth_repository.dart';

class LoginUsecase extends UseCase<UserEntity, LoginParams> {
  final AuthRepository repository;

  LoginUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, UserEntity>> call(LoginParams params) async {
    return await repository.login(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;
  const LoginParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
