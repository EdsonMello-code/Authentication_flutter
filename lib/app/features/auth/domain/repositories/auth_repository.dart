import 'package:authentication/app/features/auth/domain/DTOs/login_dto.dart';
import 'package:authentication/app/features/auth/domain/entities/base_login_entity.dart';
import 'package:authentication/app/features/auth/domain/errors/login_error.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<LoginError, BaseLoginEntity>> login(LoginDTO params);
}
