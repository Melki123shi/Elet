import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:let/core/constants/base_url.dart';
import 'package:let/core/error/exception.dart';
import 'package:let/features/authentication/data/model/user_model.dart';

abstract class AuthRemoteDatasource {
  Future<String> login({
    required String email,
    required String password,
  });

  Future<UserModel> getUser({required String token});

  Future<void> logout();

  Future<UserModel> signup({required UserModel user});

  // Future<void> changePassword({
  //   required String newPassword,
  //   required String confirmPassword,
  // });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDatasource {
  final http.Client client;
  final FlutterSecureStorage secureStorage;

  AuthRemoteDataSourceImpl({required this.client, required this.secureStorage});

  @override
  Future<UserModel> signup({required UserModel user}) async {
    print('userrrrrrrrrrrrrrrrrrr: $user');
    final response = await client.post(
      Uri.parse('$baseUrl/users'),
      body: json.encode(user),
      headers: {'Content-Type': 'application/json'},
    );

    print('response: $response');

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 400) {
      throw Exception(json.decode(response.body)['detail']);
    } else {
      throw AuthenticationException();
    }
  }

  @override
  Future<String> login(
      {required String email, required String password}) async {
    final Map<String, dynamic> user = {
      'email': email,
      'password': password,
    };
    print(json.encode(user));
    print('$baseUrl/auth');
    final response = await client.post(
      Uri.parse('$baseUrl/auth'),
      body: user,
      headers: {'Content-Type': 'application/json'},
    );

    print('response: $response');

    if (response.statusCode == 200) {
      print('yeeeeeeeeeeee');
      final responseBody = json.decode(response.body);
      final token = responseBody['x-auth-token'];
      return token;
    } else {
      throw UnauthorizedException();
    }
  }

  @override
  Future<UserModel> getUser({required String token}) async {
    final reponse = await client.get(Uri.parse('$baseUrl/users/me'),
        headers: {'Authorization': 'Bearer $token'});

    if (reponse.statusCode == 200) {
      final responseBody = json.decode(reponse.body);
      final user = UserModel.fromJson(responseBody);
      return user;
    } else {
      throw Exception('Failed to fetch user details');
    }
  }

  // @override
  // Future<Either<Failure, Unit>> changePassword(
  //     {required String newPassword, required String confirmPassword}) {
  //   // TODO: implement changePassword

  //   throw UnimplementedError();
  // }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
