import 'package:flutter/material.dart';
import 'package:glassmorphism_buttons/glassmorphism_buttons.dart';
import 'package:hr_project/components/hire_textfields.dart';
import 'package:hr_project/services/main_pages.dart';

class HireProfessional extends StatefulWidget {
  const HireProfessional({super.key});

  @override
  State<HireProfessional> createState() => _HireProfessionalState();
}

class _HireProfessionalState extends State<HireProfessional> {
  void goToHomePage() {
    Navigator.pop(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ExtraPages(),
      ),
    );
  }

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final genderController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final ageController = TextEditingController();
  final educationController = TextEditingController();
  final achivementsController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: goToHomePage,
              color: Colors.black,
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.notification_add,
                  color: Colors.black,
                ),
              )
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Center(
              child: Text(
                "",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "GET STARTED,",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Let A Professional\nCreate You'r Resume",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("*Please provide the following details"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: firstNameController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(26),
                                ),
                                hintText: "*FIRST NAME",
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade900),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade900),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                fillColor: Colors.grey.shade300,
                                filled: true),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: TextField(
                            controller: lastNameController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(26),
                                ),
                                hintText: "*LAST NAME",
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade900),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade900),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                fillColor: Colors.grey.shade300,
                                filled: true),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: genderController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(26),
                                ),
                                hintText: "*GENDER",
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade900),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade900),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                fillColor: Colors.grey.shade300,
                                filled: true),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: TextField(
                            controller: ageController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(26),
                                ),
                                hintText: "*AGE",
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade900),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade900),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                fillColor: Colors.grey.shade300,
                                filled: true),
                          ),
                        ),
                      ],
                    ),
                  ),
                  HireTextFields(
                      controller: emailController, hintText: "*E-MAIL"),
                  const SizedBox(
                    height: 10,
                  ),
                  HireTextFields(
                      controller: phoneController, hintText: "*PHONE"),
                  const SizedBox(
                    height: 10,
                  ),
                  HireTextFields(
                      controller: addressController, hintText: "*ADDRESS"),
                  const SizedBox(
                    height: 10,
                  ),
                  HireTextFields(
                      controller: educationController, hintText: "*EDUCATION"),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
                          hintText: "*ACHIEVMENTS",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade900),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade900),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          fillColor: Colors.grey.shade300,
                          filled: true),
                      minLines: 1,
                      maxLines: 50,
                      maxLength: 8000,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: GlassyButton(
                            title: "Return",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => const ExtraPages()),
                                ),
                              );
                            },
                            height: 50,
                            width: 200,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              fixedSize: const Size(20, 60),
                            ),
                            child: const Text(
                              "SUBMIT",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
