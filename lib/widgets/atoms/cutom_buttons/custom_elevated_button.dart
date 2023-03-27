import 'package:eco_tours_yucatan/providers/auth/auth_provider.dart';
import 'package:eco_tours_yucatan/style/colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.authProvider,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _emailController = emailController,
        _passwordController = passwordController;

  final AuthProvider authProvider;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        authProvider.loginWithEmailPassword(
            _emailController.text, _passwordController.text, context);
      },
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(ColorTheme.primaryColor),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(vertical: 15, horizontal: 30)),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      child: const Text(
        'Log in',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
