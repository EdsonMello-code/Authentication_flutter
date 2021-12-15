import 'package:authentication/app/features/auth/domain/entities/base_login_entity.dart';
import 'package:authentication/app/features/auth/domain/errors/login_error.dart';
import 'package:authentication/app/features/auth/domain/DTOs/login_dto.dart';
import 'package:authentication/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:authentication/app/features/auth/infra/datasources/auth_datasource.dart';
import 'package:authentication/app/features/auth/infra/models/login_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource loginDatasource;

  AuthRepositoryImpl({required this.loginDatasource});

  @override
  Future<Either<LoginError, BaseLoginEntity>> loginWithJWT(
      LoginDTO params) async {
    try {
      final LoginModel user = await loginDatasource.doLoginWithJWT(params);
      return right(user);
    } on DioError catch (error) {
      return left(LoginError(error.message));
    }
  }
}
