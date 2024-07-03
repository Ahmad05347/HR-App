import 'package:flutter/material.dart';
import 'package:hr_project/components/bottom_nav_bar.dart';
import 'package:hr_project/templates/free_templates.dart';
import 'package:hr_project/templates/paid_templates.dart';

class Templates extends StatefulWidget {
  const Templates({super.key});

  @override
  State<Templates> createState() => _TemplatesState();
}

class _TemplatesState extends State<Templates> {
  int _selectIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  final List<Widget> _pages = [
    // free templates
    const FreeTemplates(),

    // paid templates
    const PaidTemplates(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        // elevation: 0,
        //    leading: BackButton(
        //      onPressed: goToHomePage,
        //      color: Colors.white,

        //   title: const Text(
        //     "Templates",
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   titleSpacing: 90,
        // ),
        bottomNavigationBar: MyNavBar(
          onTabChange: (index) => navigateBottomBar(index),
        ),
        body: _pages[_selectIndex],
      ),
    );
    //  );
  }
}
