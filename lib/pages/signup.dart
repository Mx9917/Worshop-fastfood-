// ignore_for_file: depend_on_referenced_packages, camel_case_types

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../untility/dailog.dart';
import '../untility/style.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
   bool _islaoding = false;
  String? chooseType, name, phone, pass;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        backgroundColor: style().darkColor,
        title: const Text('sign up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: formkey,
          child: ListView(
            children: [
              // logo

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  style().logo(),
                ],
              ),
              // name
              style().heightboxs(),
              Row(
                children: [
                  style().lable('ຊື່ ແລະ ນາສະກຸນ:'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'ກາລຸນາປ້ອນຂໍ້ມູນ';
                      }
                      return null;
                    },
                    onChanged: (value) => name = value.trim(),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.face,
                        color: style().darkColor,
                      ),
                      hintText: '.....',
                      hintStyle:
                          TextStyle(fontSize: 17, color: style().darkColor),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: style().darkColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: style().pimaryColor),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  style().heightboxs(),
                ],
              ),
              // phone
              Row(
                children: [
                  style().lable('ເບີໂທລະສັບ:'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'ກາລຸນາປ້ອນຂໍ້ມູນ';
                      }
                      return null;
                    },
                    onChanged: (value) => phone = value.trim(),
                    decoration: InputDecoration(
                      prefixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 5),
                            child: style().lable('+856'),
                          )
                        ],
                      ),
                      hintText: '20...',
                      hintStyle:
                          TextStyle(fontSize: 17, color: style().darkColor),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: style().darkColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: style().pimaryColor),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  style().heightboxs(),
                ],
              ),
              // password
              Row(
                children: [
                  style().lable('ລະຫັດຜ່ານ'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'ກາລຸນາປ້ອນຂໍ້ມູນ';
                      }
                      return null;
                    },
                    onChanged: (value) => pass = value.trim(),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: style().darkColor,
                        size: 22,
                      ),
                      hintText: '...',
                      hintStyle:
                          TextStyle(fontSize: 17, color: style().darkColor),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: style().darkColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: style().pimaryColor),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  style().heightboxs(),
                ],
              ),
              // redio buttom
              style().heightboxs(),
              Row(
                children: [
                  Radio(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => style().darkColor),
                    value: 'User',
                    groupValue: chooseType,
                    onChanged: (value) => setState(
                      () {
                        chooseType = value;
                      },
                    ),
                  ),
                  style().lable('ຜູ້ສັ່ງອາຫານ'),
                ],
              ),
              Row(
                children: [
                  Radio(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => style().darkColor),
                    value: 'Shop',
                    groupValue: chooseType,
                    onChanged: (value) => setState(
                      () {
                        chooseType = value;
                      },
                    ),
                  ),
                  style().lable('ເຈົ້າຂອງອາຫານ'),
                ],
              ),
              Row(
                children: [
                  Radio(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => style().darkColor),
                    value: 'Rider',
                    groupValue: chooseType,
                    onChanged: (value) => setState(
                      () {
                        chooseType = value;
                      },
                    ),
                  ),
                  style().lable('ຜູ້ສົ່ງອາຫານ'),
                ],
              ),
              // button
              style().heightboxs(),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: MaterialButton(
                  color: style().darkColor,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: _islaoding
                        ? Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircularProgressIndicator(
                                  strokeWidth: 2.7,
                                  backgroundColor:
                                      Color.fromARGB(255, 255, 111, 0),
                                  color: Colors.white,
                                ),
                                style().widthboxs(),
                                const Text(
                                  'ກຳລັງລົງທະບຽນ...',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        : const Text(
                            'ລົງທະບຽນ',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                  onPressed: () {
                    // ignore: avoid_print
                    print(
                        'name==.$name,phone==.$phone,pass==.$pass,chooseType==.$chooseType');

                    bool validate = formkey.currentState!.validate();

                    if (validate) {
                      if (chooseType == null) {
                        massageDialog(context, DialogType.warning,
                            'ກາລຸນາເລືອກປະເພດຜູ້ໃຊ້ງານ');
                      } else {
                        checkname();
                      }
                    } else {
                      massageDialog(context, DialogType.warning,
                          'ກາລຸນາປ້ອນຂໍ້ມູນໃຫ້ຄົບ');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkname() async {
    String url =
        'http://192.168.157.1/fastfoodapi/getUserWhereName.php?isAdd=true&phone=$phone';
    try {
      Response response = await Dio().get(url);
      if (response.toString() == 'null') {
        _islaoding = true;
        signup();
      } else {
        massageDialog(context, DialogType.warning, 'ເບີນີ້ລົງທະບຽນແລ້ວ');
      }
    } catch (e) {}
  }

  Future<void> signup() async {
    String url =
        'http://192.168.157.1/fastfoodapi/addUser.php?isAdd=true&name=$name&phone=$phone&pass=$pass&chooseType=$chooseType';
    try {
      Response response = await Dio().get(url);

      if (response.toString() == 'true') {
        setState(
          () {
            massageDialogPop(context, 'ລົງທະບຽນສຳເລັດ');
            _islaoding = false;
          },
        );
      } else {
        setState(
          () {
            massageDialog(context, DialogType.error, 'ບໍ່ສາມາດລົງທະບຽນໄດ້');
            _islaoding = false;
          },
        );
      }
    } catch (e) {}
  }
}
