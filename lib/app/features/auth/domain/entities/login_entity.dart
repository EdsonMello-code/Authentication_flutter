import 'package:authentication/app/features/auth/domain/entities/base_login_entity.dart';

class LoginEntity implements BaseLoginEntity {
  final String email;
  final String name;
  final String token;

  final int id;

  const LoginEntity({
    required this.token,
    required this.email,
    required this.name,
    required this.id,
  });
}
