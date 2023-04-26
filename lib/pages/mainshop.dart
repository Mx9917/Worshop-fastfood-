// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../untility/dailog.dart';
import '../untility/style.dart';
import '../widget/list_food_menu_hhop.dart';
import '../widget/order_list_shop.dart';
import '../widget/shop_info.dart';

class mainshop extends StatefulWidget {
  const mainshop({super.key});

  @override
  State<mainshop> createState() => _mainshopState();
}

class _mainshopState extends State<mainshop> {
  Widget currentWidget = orderListShop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('mianshop'),
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
              decoration: style().boxDecorations('shop.jpg'),
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
              leading: const Icon(
                Icons.food_bank,
                size: 30,
              ),
              title: const Text(
                'ອໍເດີອາຫານ',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                setState(() {
                  currentWidget = const orderListShop();
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.fastfood,
                size: 30,
              ),
              title: const Text('ເມນູອາຫານ', style: TextStyle(fontSize: 18)),
              onTap: () {
                setState(() {
                  currentWidget = const listmenufoodshop();
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.info,
                size: 30,
              ),
              title: const Text('ລາຍລະອຽດຮ້ານ', style: TextStyle(fontSize: 18)),
              onTap: () {
                setState(() {
                  currentWidget = const shopinfo();
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.exit_to_app,
                size: 30,
              ),
              title: const Text('ອອກຈາກລະບົບ', style: TextStyle(fontSize: 18)),
              onTap: () {
                signOutprocess(context);
              },
            ),
          ],
        ),
      ),
      //End  Drawer
      body: currentWidget,
    );
  }
}
