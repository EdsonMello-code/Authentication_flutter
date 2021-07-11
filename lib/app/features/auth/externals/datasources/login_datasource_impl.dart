import 'package:authentication/app/features/auth/domain/DTOs/login_dto.dart';
import 'package:authentication/app/features/auth/infra/models/login_model.dart';
import 'package:authentication/app/features/auth/infra/datasources/login_datasource.dart';
import 'package:dio/dio.dart';

class LoginDatasourceImpl implements LoginDatasource {
  final Dio httpClient;

  const LoginDatasourceImpl({required this.httpClient});
  @override
  Future<LoginModel> doLogin(LoginDTO params) async {
    final response = await httpClient.post(
      'http://localhost:3333/users/authenticate',
      data: {"password": params.password, "email": params.email},
    );

    final data = response.data as Map;

    print(data);
    final user = LoginModel.fromMap(data);

    return user;
  }
}
