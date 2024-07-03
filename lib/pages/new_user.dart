// ignore_for_file: use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hr_project/components/textfields.dart';

class NewUser extends StatefulWidget {
  final Function()? onTap;

  const NewUser({super.key, required this.onTap});

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  // void goToLoginPage() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => const LoginPage(),
  //     ),
  //   );
  // }

  final emailController = TextEditingController();
  final passwordColtroller = TextEditingController();
  final confirmPasswordColtroller = TextEditingController();

  void createUser() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    if (passwordColtroller.text != confirmPasswordColtroller.text) {
      Navigator.pop(context);
      displayMessage("Password's don't match");
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordColtroller.text);

      FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
          .set({
        "username": emailController.text.split('@')[0],
        "bio": "Empty bio..."
      });

      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessage(e.code);
    }
  }

  void displayMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(
            //   height: 60,
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                height: 430,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Align(
                      alignment: Alignment.topCenter,
                      child: Icon(
                        Icons.android,
                        size: 80,
                      ),
                    ),
                    const Text("Let's Create An Account For You"),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFields(
                      controller: emailController,
                      hintText: "Email",
                      obsecureText: false,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFields(
                      controller: passwordColtroller,
                      hintText: "Password",
                      obsecureText: true,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFields(
                      controller: confirmPasswordColtroller,
                      hintText: "Confirm Password",
                      obsecureText: true,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: createUser,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            "Register",
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 22),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Already a Member?",
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),

                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    "Return to LoginPage",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),

                // GlassyButton(
                //     title: "Return",
                //     onTap: widget.onTap,
                //     width: MediaQuery.of(context).size.width,
                //     height: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
