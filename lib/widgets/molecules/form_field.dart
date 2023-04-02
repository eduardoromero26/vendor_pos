import 'package:vendor_pos/widgets/atoms/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';

class FormField extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  FormField({
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: emailController,
          hintText: 'Email address',
          prefixIcon: Icons.email,
        ),
        SizedBox(height: 20),
        CustomTextField(
          controller: passwordController,
          hintText: 'Password',
          prefixIcon: Icons.lock,
          obscureText: true,
        ),
      ],
    );
  }
}
