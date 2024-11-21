import 'package:dartz/dartz.dart';
import 'package:let/core/error/failure.dart';
import 'package:let/features/authentication/domain/entity/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signup({
    // required String fullName,
    // required String email,
    // required String password,
    // required String workTitle,
    // required String bio,
    // required String profilePicture,
    // required List<String> skills,
    // required List<String> experiences,
    // required String location,
    required UserEntity user
  });

  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, UserEntity>> getUser(String token);

  Future<Either<Failure, void>> changePassword({
    required String newPassword,
    required String confirmPassword,
  });
}
