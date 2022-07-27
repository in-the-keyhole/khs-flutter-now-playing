import 'package:flutter/material.dart';
import 'login_text_field.dart';

class LoginForm extends StatefulWidget {
  final Function(String, String) onSubmit;

  const LoginForm({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: const Center(
              child: Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            margin: const EdgeInsets.only(
              bottom: 10,
            ),
          ),
          LoginTextField(
            labelText: 'Username',
            errorText: 'Username is required',
            controller: usernameController,
          ),
          Container(
            child: LoginTextField(
              labelText: 'Password',
              errorText: 'Password is required',
              controller: passwordController,
              obscureText: true,
            ),
            margin: const EdgeInsets.only(
              top: 10,
              bottom: 20,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                widget.onSubmit(
                    usernameController.text, passwordController.text);
              }
            },
            child: const Text('Login'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(45),
            ),
          ),
        ],
      ),
    );
  }
}
