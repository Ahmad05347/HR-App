import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hr_project/pages/login_or_register.dart';
import 'package:hr_project/services/main_pages.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // is the user loged in

          if (snapshot.hasData) {
            return const ExtraPages();
          } else {
            return const LoginOrRegister();
          }

          // user not loged in
        },
      ),
    );
  }
}
