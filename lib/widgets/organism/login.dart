// import 'package:flutter/material.dart';

// class Login extends StatelessWidget {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 30),
//               Text(
//                 'Welcome back!',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'Log in to your account',
//                 style: TextStyle(fontSize: 18, color: Colors.grey),
//               ),
//               SizedBox(height: 50),
//               CustomTextField(
//                 controller: _emailController,
//                 hintText: 'Email address',
//                 prefixIcon: Icons.email,
//               ),
//               SizedBox(height: 20),
//               CustomTextField(
//                 controller: _passwordController,
//                 hintText: 'Password',
//                 prefixIcon: Icons.lock,
//                 obscureText: true,
//               ),
//               SizedBox(height: 40),
//               ElevatedButton(
//                 onPressed: () {},
//                 child: Text(
//                   'Log in',
//                   style: TextStyle(fontSize: 16),
//                 ),
//                 style: ButtonStyle(
//                   padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
//                       EdgeInsets.symmetric(vertical: 15)),
//                   backgroundColor:
//                       MaterialStateProperty.all<Color>(Colors.blue),
//                   shape: MaterialStateProperty.all<OutlinedBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 30),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Don\'t have an account?',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: Text(
//                       'Sign up',
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
