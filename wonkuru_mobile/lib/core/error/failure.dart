import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties;

  const Failure([this.properties = const <dynamic>[]]);

  @override
  List<Object?> get props => properties;
}

//General failure
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class NetworkFailure extends Failure {
  final String errorMessage;
  const NetworkFailure({this.errorMessage = 'No internet connection'});
}

class UnauthorizedFailure extends Failure {
  final String errorMessage;

  const UnauthorizedFailure({this.errorMessage = 'Incorrect phone number or password'});
}

class AuthenticationFailure extends Failure {
  final String errorMessage;

  const AuthenticationFailure({this.errorMessage = 'Authentication failed'});
}


// class ServerFailure extends Failure {
//   @override
//   final String errorMessage;
//   ServerFailure({this.errorMessage = 'Server failure'});
// }

// class CacheFailure extends Failure {
//   @override
//   final String errorMessage;
//   CacheFailure({this.errorMessage = 'Cache failure'});
// }



// class AnonymousFailure extends Failure {
//   @override
//   final String errorMessage;
//   AnonymousFailure({this.errorMessage = 'Unknown error happened'});
// }