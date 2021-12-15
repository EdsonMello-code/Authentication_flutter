import 'package:authentication/app/features/auth/domain/DTOs/login_dto.dart';
import 'package:authentication/app/features/auth/infra/models/login_model.dart';

abstract class AuthDatasource {
  Future<LoginModel> doLoginWithJWT(LoginDTO params);
  Future<LoginModel> doLoginWithOAuth(LoginDTO params);
}
