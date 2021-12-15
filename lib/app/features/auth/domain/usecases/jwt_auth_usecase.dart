import 'package:authentication/app/features/auth/domain/DTOs/login_dto.dart';
import 'package:authentication/app/features/auth/domain/entities/base_login_entity.dart';
import 'package:authentication/app/features/auth/domain/errors/login_error.dart';
import 'package:authentication/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

abstract class IJWTAuthUsecase {
  Future<Either<LoginError, BaseLoginEntity>> call(LoginDTO params);
}

class JWTAuthUsecase implements IJWTAuthUsecase {
  final AuthRepository authRepository;

  const JWTAuthUsecase({required this.authRepository});

  @override
  Future<Either<LoginError, BaseLoginEntity>> call(LoginDTO params) async {
    final user = await authRepository.loginWithJWT(params);
    return user;
  }
}
