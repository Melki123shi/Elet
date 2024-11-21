import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:let/features/authentication/data/model/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> saveToken(String token);

  Future<String?> getToken();

  Future<void> deleteToken();

  Future<void> storeUser(UserModel userCredential);

  Future<UserModel?> getUserCredentials();
}

class AuthLocalDataSourceImpl
    implements AuthLocalDataSource {
  final FlutterSecureStorage secureStorage;

  AuthLocalDataSourceImpl({required this.secureStorage});

  @override
  Future<void> saveToken(String token) async {
    await secureStorage.write(key: 'auth_token', value: token);
  }

  @override
  Future<String?> getToken() async {
    return await secureStorage.read(key: 'auth_token');
  }

  @override
  Future<void> deleteToken() async {
    await secureStorage.delete(key: 'auth_token');
  }

  @override
  Future<void> storeUser(UserModel userCredential) async {
    final userJson = json.encode(userCredential.toJson());
    await secureStorage.write(key: 'user_credentials', value: userJson);
  }

  @override
  Future<UserModel?> getUserCredentials() async {
    final userJson = await secureStorage.read(key: 'user_credentials');
    if (userJson != null) {
      final Map<String, dynamic> userMap = json.decode(userJson);
      UserModel userModel =
          UserModel.fromJson(userMap);
      return userModel;
    }
    return null;
  }
}