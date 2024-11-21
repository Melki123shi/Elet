import 'package:dartz/dartz.dart';
import 'package:let/core/error/exception.dart';
import 'package:let/core/error/failure.dart';
import 'package:let/core/network/network_info.dart';
import 'package:let/features/authentication/data/datasource/auth_local_datasource.dart';
import 'package:let/features/authentication/data/datasource/auth_remote_datasource.dart';
import 'package:let/features/authentication/data/model/user_model.dart';
import 'package:let/features/authentication/domain/entity/user_entity.dart';
import 'package:let/features/authentication/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDatasource remoteDatasource;
  final NetworkInfo networkInfo;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDatasource,
    required this.networkInfo,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, UserEntity>> getUser(String token) async {
    try {
      final UserModel user = await remoteDatasource.getUser(token: token);
      user.token = token;
      await localDataSource.storeUser(user);
      return Right(user);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login(
      {required String email, required String password}) async {
    if (await networkInfo.isConnected) {
      try {
        final token = await remoteDatasource.login(
          email: email,
          password: password,
        );

        await localDataSource.saveToken(token);
        print(token);
        try {
          final user = await getUser(token);
          print(user);
          return user;
        } on UnauthorizedException {
          return const Left(UnauthorizedFailure());
        } catch (e) {
          return Left(ServerFailure());
        }
      } on UnauthorizedException {
        return const Left(UnauthorizedFailure());
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    if (await networkInfo.isConnected) {
      try {
        await localDataSource.deleteToken();
        return const Right(null);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signup({required UserEntity user}) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await remoteDatasource.signup(user: UserModel.toModel(user));
        return Right(response);
      } catch (e) {
        return Left(AuthenticationFailure(errorMessage: e.toString()));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> changePassword(
      {required String newPassword, required String confirmPassword}) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }
}
