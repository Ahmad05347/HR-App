import 'package:flutter/material.dart';
import 'package:hr_project/pages/homepage.dart';
import 'package:hr_project/pages/my_settings.dart';
import 'package:hr_project/pages/profile_page.dart';
import 'package:hr_project/pages/search_page.dart';

class ExtraPages extends StatefulWidget {
  const ExtraPages({
    super.key,
  });

  @override
  State<ExtraPages> createState() => _ExtraPagesState();
}

class _ExtraPagesState extends State<ExtraPages> {
  int _myIndex = 0;
  final _pages = [
    const HomePage(),
    const SearchPage(),
    const MySettings(),
    const ProfilePage(),
  ];
  void onTap(int index) {
    setState(
      () {
        _myIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 0,
          unselectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          onTap: onTap,
          currentIndex: _myIndex,
          elevation: 0,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.withOpacity(0.7),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.apps,
              ),
              label: "HOME",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search_rounded,
              ),
              label: "SEARCH",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_rounded,
              ),
              label: "SETTINGS",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_3_rounded,
              ),
              label: "PROFILE",
            ),
          ],
        ),
        body: Center(
          child: _pages[_myIndex],
        )

        // IndexedStack(
        //   children: ,
        //   index: _myIndex,
        // ),
        );
  }
}
