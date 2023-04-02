import 'package:vendor_pos/providers/auth/auth_provider.dart';
import 'package:vendor_pos/style/colors.dart';
import 'package:vendor_pos/widgets/atoms/custom_text_field/custom_text_field.dart';
import 'package:vendor_pos/widgets/atoms/cutom_buttons/custom_elevated_button.dart';
import 'package:vendor_pos/widgets/atoms/cutom_buttons/custom_text_button.dart';
import 'package:vendor_pos/widgets/atoms/text/wrap_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              WrapText(
                  text: 'Welcome back!',
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
              const SizedBox(height: 10),
              WrapText(
                text: 'Log in to your account',
                fontSize: 18.0,
                fontColor: Colors.grey,
              ),
              const SizedBox(height: 50),
              CustomTextField(
                controller: _emailController,
                hintText: 'Email address',
                prefixIcon: Icons.email,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _passwordController,
                hintText: 'Password',
                prefixIcon: Icons.lock,
                obscureText: true,
              ),
              const SizedBox(height: 40),
              CustomElevatedButton(
                  authProvider: authProvider,
                  emailController: _emailController,
                  passwordController: _passwordController),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(fontSize: 16),
                  ),
                  CustomTextButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}