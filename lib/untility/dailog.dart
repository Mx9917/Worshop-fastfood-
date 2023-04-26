// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/usermodle.dart';
import '../pages/home.dart';

Future<void> massageDialog(
  BuildContext context,
  DialogType dialogType,
  String desc,
) async {
  AwesomeDialog(
    context: context,
    dialogType: dialogType,
    animType: AnimType.scale,
    btnOkText: 'ຕົກລົງ',
    buttonsTextStyle: const TextStyle(fontSize: 18),
    btnOkOnPress: () {},
    title: 'ແຈ້ງເຕືອນ',
    desc: desc,
    descTextStyle: const TextStyle(
      fontSize: 20,
    ),
    titleTextStyle: const TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
  ).show();
}

Future<void> massageDialogPop(
  BuildContext context,
  String desc,
) async {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.success,
    animType: AnimType.scale,
    title: 'ແຈ້ງເຕືອນ',
    desc: desc,
    descTextStyle: const TextStyle(
      fontSize: 20,
    ),
    titleTextStyle: const TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
    autoHide: const Duration(seconds: 3),
  ).show().then(
    (value) {
      Navigator.pop(context);
    },
  );
}

Future<void> signOutprocess(BuildContext context) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.clear();
  // exit(0);
  MaterialPageRoute route =
      MaterialPageRoute(builder: (context) => const home());
  Navigator.pushAndRemoveUntil(context, route, (route) => false);
}

Future<void> routePageSignin(
    BuildContext context, Widget newPage, usermodel userModel) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString('id', userModel.id!);
  preferences.setString('name', userModel.name!);
  preferences.setString('chooseType', userModel.choosetype!);
  MaterialPageRoute route = MaterialPageRoute(
    builder: (context) => newPage,
  );
  Navigator.pushAndRemoveUntil(context, route, (route) => false);
}

Future<void> routePages(
  BuildContext context,
  Widget newPage,
) async {
  MaterialPageRoute route = MaterialPageRoute(
    builder: (context) => newPage,
  );
  Navigator.pushAndRemoveUntil(context, route, (route) => false);
}

Future<void> pushPages(
  BuildContext context,
  Widget newPage,
) async {
  MaterialPageRoute route = MaterialPageRoute(
    builder: (context) => newPage,
  );
  Navigator.push(
    context,
    route,
  );
}
