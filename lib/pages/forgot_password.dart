import 'package:flutter/material.dart';

import '../components/textfields.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                iconTheme: const IconThemeData(color: Colors.black),
                expandedHeight: 50,
                backgroundColor: Colors.transparent,
                title: const Center(
                  child: Text(
                    "",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w300),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notification_add),
                  ),
                ],
                titleSpacing: 50,
                floating: true,
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          "lib/images/reset.png",
                          height: 100,
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      "FORGET",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    const Text(
                      "PASSWORD?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    const Text(
                      "Provide your account EMAIL for which you want to reset your password",
                      style: TextStyle(fontSize: 10),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFields(
                        controller: emailController,
                        hintText: "Email",
                        obsecureText: false),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.all(25),
                      width: 360,
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Continue",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
