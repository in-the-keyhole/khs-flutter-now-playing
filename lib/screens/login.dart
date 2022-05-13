import 'package:flutter/material.dart';
import 'package:khs_flutter_web_now_playing/services/auth_service.dart';
import 'package:khs_flutter_web_now_playing/widgets/login_form.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  void handleSubmit(String username, String password, BuildContext context) async {
    await context.read<AuthService>().authenticateUser(username, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/backdrops/login-backdrop.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  top: 7,
                ),
                child: Image.asset(
                  'assets/images/logo.gif',
                  scale: 5.5,
                ),
              ),
              Row(
                children: [
                  Container(
                    child: LoginForm(
                      onSubmit: (String username, String password) => handleSubmit(username, password, context),
                    ),
                    width: 400,
                    color: Colors.white,
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(top: 40),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          )
        ],
      ),
    );
  }
}
