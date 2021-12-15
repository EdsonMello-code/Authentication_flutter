import 'dart:io';

import 'package:authentication/app/features/auth/domain/DTOs/login_dto.dart';
import 'package:authentication/app/features/auth/externals/datasources/services/client_http.dart';
import 'package:authentication/app/features/auth/infra/models/login_model.dart';
import 'package:authentication/app/features/auth/infra/datasources/auth_datasource.dart';

class LoginDatasourceImpl implements AuthDatasource {
  final IHttpClient httpClient;

  const LoginDatasourceImpl({required this.httpClient});
  @override
  Future<LoginModel> doLoginWithJWT(LoginDTO params) async {
    final response = await httpClient.post(
      'http://localhost:3333/users/authenticate',
      data: {"password": params.password, "email": params.email},
    );

    final data = response.data as Map;

    print(data);
    final user = LoginModel.fromMap(data);

    return user;
  }

  @override
  Future<LoginModel> doLoginWithOAuth(LoginDTO params) {
    // TODO: implement doLoginWithOAuth
    throw UnimplementedError();
  }
}
