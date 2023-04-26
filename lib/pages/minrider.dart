// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../untility/dailog.dart';
import '../untility/style.dart';

class mainrider extends StatefulWidget {
  const mainrider({super.key});

  @override
  State<mainrider> createState() => _mainriderState();
}

class _mainriderState extends State<mainrider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('mainrider'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => signOutprocess(context),
          ),
        ],
      ),
      // Drawer
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: style().boxDecorations('rider.jpg'),
              currentAccountPicture: style().logo(),
              accountName: Text(
                'Guest',
                style: TextStyle(
                    color: style().darkColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                'Plaess login',
                style: TextStyle(color: style().pimaryColor, fontSize: 18),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.android),
              title: const Text('Sign In'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.android),
              title: const Text('Sign Up'),
              onTap: () {},
            ),
          ],
        ),
      ),
      //End  Drawer
    );
  }
}
