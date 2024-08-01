// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:souchat/services/auth/auth_service.dart';
import 'package:souchat/components/my_button.dart';
import 'package:souchat/components/my_text_field.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final void Function()? onTap;
  LoginPage({super.key, required this.onTap});

  void login(BuildContext context) async {
    final authService = AuthService();
    try {
      await authService.signInWithEmailPassword(
          _emailcontroller.text, _passwordcontroller.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.grey.shade900,
          title: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.anchor, size: 60, color: Colors.white),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Welcome Back To SouChat!",
                style: TextStyle(
                  fontFamily: 'San Francisco',
                  fontWeight: FontWeight.normal,
                  fontSize: 24,
                  color: Color.fromARGB(255, 83, 83, 83),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              MyTextfield(
                hintText: 'Email',
                obsecure: false,
                controller: _emailcontroller,
              ),
              const SizedBox(
                height: 25,
              ),
              MyTextfield(
                hintText: 'Password',
                obsecure: true,
                controller: _passwordcontroller,
              ),
              const SizedBox(
                height: 25,
              ),
              myButton(
                text: "Login",
                onTap: () => login(context),
              ),
              const SizedBox(
                height: 12.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member? ",
                    style: TextStyle(
                      fontFamily: 'San Francisco',
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Register Now",
                      style: TextStyle(
                        fontFamily: 'San Francisco',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
