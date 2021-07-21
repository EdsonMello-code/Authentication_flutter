import 'package:authentication/app/features/shared/interfaces/form_validate_controller.dart';
import 'package:email_validator/email_validator.dart';

class LoginController implements FormValidateController {
  const LoginController();

  @override
  String? emailValidate(String? email) {
    if (email == null) {
      return 'O campo email não pode ser vazio';
    }

    final isValideEmail = EmailValidator.validate(email);
    return isValideEmail ? null : 'Email inválido!';
  }

  @override
  String? passwordValidate(String? password) {
    if (password == null) {
      return 'O campo password não pode ser vazio';
    }

    final regexPassword = RegExp(
        r'(?=^.{8,}$)(?=.*\d)(?=.*[!@#$%^&*]+)(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$');

    final isPasswordValid = regexPassword.hasMatch(password);
    print(isPasswordValid);
    if (!isPasswordValid) {
      return 'Password deve ser mais forte!';
    }

    return null;
  }
}
