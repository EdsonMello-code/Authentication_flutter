import 'package:authentication/app/features/auth/domain/DTOs/login_dto.dart';
import 'package:authentication/app/features/auth/domain/entities/base_login_entity.dart';
import 'package:authentication/app/features/auth/domain/errors/login_error.dart';
import 'package:authentication/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ILoginRepository {
  Future<Either<LoginError, BaseLoginEntity>> call(LoginDTO params);
}

class LoginUsecase implements ILoginRepository {
  final AuthRepository authRepository;

  const LoginUsecase({required this.authRepository});

  @override
  Future<Either<LoginError, BaseLoginEntity>> call(LoginDTO params) async {
    final user = await authRepository.login(params);
    return user;
  }
}
