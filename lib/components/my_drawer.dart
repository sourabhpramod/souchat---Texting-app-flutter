// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:souchat/services/auth/auth_service.dart';
import 'package:souchat/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final _auth = AuthService();
    _auth.singOut();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: const Color.fromARGB(255, 49, 49, 49),
        child: Column(
          children: [
            DrawerHeader(
              child: Center(
                  child: Icon(
                Icons.anchor,
                color: Colors.white,
                size: 40,
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: ListTile(
                title: Text("Home", style: TextStyle(color: Colors.white)),
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: ListTile(
                title: Text(
                  "Blocked Users",
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(Icons.block, color: Colors.white),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsPage()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: ListTile(
                title: Text("Logout", style: TextStyle(color: Colors.white)),
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                onTap: () {
                  logout();
                },
              ),
            ),
          ],
        ));
  }
}
