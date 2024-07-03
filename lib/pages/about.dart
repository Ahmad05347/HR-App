import 'package:flutter/material.dart';

import 'homepage.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  void goToHomePage() {
    Navigator.pop(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButton(
            onPressed: goToHomePage,
            color: Colors.black,
          ),
          title: const Text(
            "About",
            style: TextStyle(color: Colors.black),
          ),
          titleSpacing: 100,
        ),
        body: Center(
          child: ListView(
            children: const [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hello minnions as we all know that this world doesnot require any type of solitude and we are here to show the world that we are the superior beings and we will dominate the system that this world has adopted",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

//  bottomNavigationBar: BottomNavigationBar(
//            items: const <BottomNavigationBarItem>[
  //            BottomNavigationBarItem(
    //              icon: Icon(Icons.home_sharp), label: "Home"),
      //        BottomNavigationBarItem(
        //          icon: Icon(Icons.search_outlined), label: "Search"),
          //    BottomNavigationBarItem(
            //      icon: Icon(Icons.settings), label: "Settings"),
  //          ],
    //      ),