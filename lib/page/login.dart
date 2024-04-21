import 'package:flutter/material.dart';
import 'package:flutter_application/page/menu.dart';
import 'package:flutter_login/flutter_login.dart';

const users = {
  'dribbble@gmail.com': '12345',
  'lorena@gmail.com': '123',
  'rafael@gmail.com': '123',
};

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'El usuario no existe';
      }
      if (users[data.name] != data.password) {
        return 'Contrasena incorrecta';
      }
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Nombre de usuario no existe';
      }
      return name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Agenda Escolar',
      //logo: const AssetImage('assets/images/ecorp-lightblue.png'),
      onLogin: _authUser,

      onSubmitAnimationCompleted: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MyHomePage(title: "Mensaje desde la Pantalla1")));
      },

      onRecoverPassword: _recoverPassword,
      messages: LoginMessages(
        userHint: 'Usuario',
        passwordHint: 'Contraseña',
        loginButton: 'INGRESAR',
        forgotPasswordButton: 'Olvidaste tu contraseña?',
      ),
    );
  }
}
