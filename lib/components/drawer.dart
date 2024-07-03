import 'package:flutter/material.dart';
import 'package:hr_project/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? profileTap;
  final void Function()? logout;
  final void Function()? about;
  final void Function()? templates;
  final void Function()? settings;
  final void Function()? payments;
  const MyDrawer(
      {super.key,
      required this.profileTap,
      required this.logout,
      required this.about,
      required this.payments,
      required this.settings,
      required this.templates});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Profile Icon
          Column(
            children: [
              const DrawerHeader(
                child: Icon(
                  Icons.person_4_rounded,
                  color: Colors.white,
                  size: 80,
                ),
              ),

              // Account
              // Padding(
              //   padding: const EdgeInsets.only(top: 20),
              //   child: MyListTile(
              //     icon: Icons.home,
              //     text: "H O M E",
              //     onTap: () => Navigator.pop(context),
              //   ),
              // ),

              // Profile page

              MyListTile(
                icon: Icons.person_add_alt_1_outlined,
                text: "P R O F I L E",
                onTap: profileTap,
              ),

              // Templates
              MyListTile(
                icon: Icons.widgets,
                text: "T E M P L A T E S",
                onTap: templates,
              ),

              // payment method
              MyListTile(
                icon: Icons.monetization_on_rounded,
                text: "P A Y M E N T",
                onTap: payments,
              ),

              // settings
              MyListTile(
                icon: Icons.settings_applications_sharp,
                text: "S E T T I N G S",
                onTap: settings,
              ),
            ],
          ),

          // About

          Column(
            children: [
              MyListTile(
                icon: Icons.padding_outlined,
                text: "A B O U T",
                onTap: about,
              ),

              // Logout method

              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: MyListTile(
                  icon: Icons.logout_rounded,
                  text: "L O G O U T",
                  onTap: logout,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
