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
    final regexEmail = RegExp(r''' 
    ^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$
    ''');
    final regexPassword = RegExp(
        r'(?=^.{8,}$)(?=.*\d)(?=.*[!@#$%^&*]+)(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$');

    final isEmailValid = regexEmail.hasMatch(params.email);
    final isPasswordValid = regexPassword.hasMatch(params.password);

    if (isEmailValid) {
      return left(LoginError('Email deve ser válido!'));
    }

    if (isPasswordValid) {
      return left(LoginError('Password deve ser mais forte!'));
    }

    final user = await authRepository.login(params);
    return user;
  }
}
