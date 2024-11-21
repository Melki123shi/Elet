import 'package:let/core/injections/injection.dart';
import 'package:let/features/authentication/data/datasource/auth_local_datasource.dart';
import 'package:let/features/authentication/data/datasource/auth_remote_datasource.dart';
import 'package:let/features/authentication/data/repository/auth_repositories_impl.dart';
import 'package:let/features/authentication/domain/repository/auth_repository.dart';
import 'package:let/features/authentication/domain/usecases/login_usecase.dart';
import 'package:let/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:let/features/authentication/presentation/bloc/auth_bloc.dart';

class AuthInjection {
  init() {
    //! Bloc
    sl.registerFactory(() => AuthBloc(
          // changePasswordUsecase: sl(),
          loginUsecase: sl(),
          // logoutUsecase: sl(),
          signupUsecase: sl(),
        ));

    //! Data
    sl.registerLazySingleton<AuthRemoteDatasource>(
        () => AuthRemoteDataSourceImpl(client: sl(), secureStorage: sl()));
    sl.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(secureStorage: sl()));

    //! Repository
    sl.registerLazySingleton<AuthRepository>(() =>
        AuthRepositoryImpl(networkInfo: sl(), remoteDatasource: sl(), localDataSource: sl()));

    //! usecase
    sl.registerLazySingleton(() => LoginUsecase(repository: sl()));
    sl.registerLazySingleton(() => SignupUsecase(repository: sl()));
    // sl.registerLazySingleton(() => LogoutUsecase(repository: sl()));
    // sl.registerLazySingleton(() => ChangePasswordUsecase(repository: sl()));
  }
}