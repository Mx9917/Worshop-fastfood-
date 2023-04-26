import 'package:fastfood/pages/signin.dart';
import 'package:fastfood/pages/signup.dart';
import 'package:fastfood/untility/style.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // Drawer
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: style().boxDecorations('guest.jpg'),
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
              onTap: () {
                Navigator.pop(context);
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (value) => const signin(),
                );
                Navigator.push(context, route);
              },
            ),
            ListTile(
              leading: const Icon(Icons.android),
              title: const Text('Sign Up'),
              onTap: () {
                Navigator.pop(context);
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (value) => const signup(),
                );
                Navigator.push(context, route);
              },
            ),
          ],
        ),
      ),
      //End  Drawer
    );
  }
}
