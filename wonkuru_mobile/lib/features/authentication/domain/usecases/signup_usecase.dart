import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:let/core/error/failure.dart';
import 'package:let/core/usecases/usecases.dart';
import 'package:let/features/authentication/domain/entity/user_entity.dart';
import 'package:let/features/authentication/domain/repository/auth_repository.dart';

class SignupUsecase extends UseCase<UserEntity, SignupParams> {
  final AuthRepository repository;

  SignupUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, UserEntity>> call(SignupParams params) async {
    return await repository.signup(
      user: params.user,
    );
  }
}

class SignupParams extends Equatable {
  final UserEntity user;

  const SignupParams({
    required this.user,
  });

  @override
  List<Object?> get props => [
        user
      ];
}
