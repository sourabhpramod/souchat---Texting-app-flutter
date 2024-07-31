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
        backgroundColor: Color.fromARGB(255, 247, 222, 255),
        child: Column(
          children: [
            DrawerHeader(
              child: Center(
                  child: Icon(
                Icons.message,
                size: 40,
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: ListTile(
                title: Text("Blocked Users"),
                leading: Icon(Icons.block),
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
                title: Text("Logout"),
                leading: Icon(Icons.logout),
                onTap: () {
                  logout();
                },
              ),
            ),
          ],
        ));
  }
}
