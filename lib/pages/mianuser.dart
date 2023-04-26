import 'package:fastfood/untility/dailog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../untility/style.dart';

class mianuser extends StatefulWidget {
  const mianuser({super.key});

  @override
  State<mianuser> createState() => _mianuserState();
}

class _mianuserState extends State<mianuser> {
  String? nameUser;
  @override
  void initState() {
    findUser();
    super.initState();
  }

  Future<void> findUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(
      () {
        nameUser = preferences.getString('name');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('miansuer'),
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
              decoration: style().boxDecorations('user.jpg'),
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
      body: Center(
        child: Text(nameUser == null ? 'kfk' : '${nameUser!}'),
      ),
    );
  }
}
