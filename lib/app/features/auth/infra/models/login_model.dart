import 'package:authentication/app/features/auth/domain/entities/base_login_entity.dart';

class LoginModel implements BaseLoginEntity {
  final String email;

  final int id;

  final String name;

  final String token;

  const LoginModel(
      {required this.email,
      required this.id,
      required this.name,
      required this.token});

  static LoginModel fromMap(map) {
    return LoginModel(
        id: map['user']['id'],
        email: map['user']['email'],
        name: map['user']['name'],
        token: map['token']);
  }
}
