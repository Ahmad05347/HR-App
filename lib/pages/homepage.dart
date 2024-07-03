import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hr_project/components/drawer.dart';
import 'package:hr_project/pages/about.dart';
import 'package:hr_project/pages/hire.dart';
import 'package:hr_project/pages/my_settings.dart';
import 'package:hr_project/pages/profile_page.dart';
import 'package:hr_project/pages/services.dart';
import 'package:hr_project/templates/templates.dart';
import 'package:hr_project/templates/templates_screens.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  void goToProfilePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      ),
    );
  }

  void goToAbout() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const About(),
      ),
    );
  }

  void goToTemplates() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Templates(),
      ),
    );
  }

  void goToHirePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HireProfessional(),
      ),
    );
  }

  void goToServicePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Services(),
      ),
    );
  }

  void goToPayments() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TemplatesScreens(),
      ),
    );
  }

  void goToSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MySettings(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: Center(
        // child: Container(
        //   constraints: const BoxConstraints.expand(),
        //   decoration: const BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage("lib/images/dark2.jpg"), fit: BoxFit.cover),
        //   ),
        child: Scaffold(
          backgroundColor: Colors.white, // IMPORTANT COLOR THEME

          drawer: MyDrawer(
              profileTap: goToProfilePage,
              logout: signUserOut,
              about: goToAbout,
              payments: goToPayments,
              settings: goToSettings,
              templates: goToTemplates),

          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                iconTheme: const IconThemeData(color: Colors.black),
                expandedHeight: 50,
                backgroundColor: Colors.transparent,
                title: const Center(
                  child: Text(
                    "WELCOME",
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
                //  shadowColor: Color.fromARGB(255, 158, 57, 91),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("Users")
                          .doc(currentUser.email)
                          .snapshots(),
                      builder: (context, snapshots) {
                        if (snapshots.hasData) {
                          final userData =
                              snapshots.data!.data() as Map<String, dynamic>;
                          return Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 70,
                              decoration: BoxDecoration(
                                //  color: Colors.grey.shade800,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: SizedBox(
                                child: GestureDetector(
                                  onTap: goToProfilePage,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Text(
                                            // ignore: prefer_interpolation_to_compose_strings
                                            "Hello! \n" + userData["username"],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 140),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons
                                                    .circle_notifications_rounded,
                                                color: Colors.grey.shade700,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else if (snapshots.hasError) {
                          return Center(
                            child: Text("Error${snapshots.hasError}"),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 27),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "DISCOVER",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25, left: 25),
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          image: const DecorationImage(
                              image: AssetImage("lib/images/dark.jpg"),
                              fit: BoxFit.cover),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          // boxShadow: [
                          //   BoxShadow(
                          //       offset: Offset(5, 10),
                          //       blurRadius: 20,
                          //       color: Colors.grey),
                          //  ],
                          // image: DecorationImage(
                          //     image: AssetImage("lib/images/person.jpg"),
                          //     fit: BoxFit.contain),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 20, top: 15),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "HIRE A PROFESSIONAL\nTo Create Your Resume",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                    left: 20,
                                    top: 10,
                                  ),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "\$9.99",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.only(
                                //     left: 20,
                                //   ),
                                //   child: Align(
                                //     alignment: Alignment.topLeft,
                                //     child: Text(
                                //       "\$19.99",
                                //       style: TextStyle(
                                //           fontSize: 16,
                                //           color: Colors.white,
                                //           fontWeight: FontWeight.w300,
                                //           decoration:
                                //               TextDecoration.lineThrough,
                                //           decorationColor:
                                //               Colors.grey.shade700),
                                //     ),
                                //   ),
                                // ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ElevatedButton(
                                    onPressed: goToHirePage,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey.shade600,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    child: const Text(
                                      "Continue",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 27),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CATEGORIES",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, bottom: 5, right: 30),
                      child: InkWell(
                        onTap: goToPayments,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: const EdgeInsets.only(
                                  left: 20,
                                ),
                                height: 190,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          "lib/images/ideogram (2).jpeg"),
                                      fit: BoxFit.cover),
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(26),
                                      bottomLeft: Radius.circular(26),
                                      bottomRight: Radius.circular(12)),
                                  color: Colors.grey.shade900,
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //       blurRadius: 5,
                                  //       offset: const Offset(5, 7),
                                  //       color: Colors.grey.shade400),
                                  // ],
                                ),
                                child: const Align(
                                  alignment: Alignment.topCenter,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        "New\nCollections",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 5),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 90,
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              "lib/images/ideogram (3).jpeg"),
                                          fit: BoxFit.fill,
                                        ),
                                        color: Colors.grey.shade800,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Center(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.trending_up_rounded,
                                                  color: Colors.white,
                                                  size: 25,
                                                ),
                                                Text(
                                                  "Trending",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 5, top: 10),
                                    child: Container(
                                      height: 90,
                                      width: MediaQuery.of(context).size.width,
                                      // margin: const EdgeInsets.only(left: 30),
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                "lib/images/ideogram (1).jpeg"),
                                            fit: BoxFit.cover),
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(26),
                                            bottomLeft: Radius.circular(26),
                                            bottomRight: Radius.circular(12)),
                                        color: Colors.grey.shade800,
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //       blurRadius: 5,
                                        //       offset: const Offset(5, 7),
                                        //       color: Colors.grey.shade400),
                                        // ],
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Center(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons
                                                      .favorite_outline_rounded,
                                                  color: Colors.white,
                                                  size: 25,
                                                ),
                                                Text(
                                                  "Favourites",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      //   ),
    );
  }
}
