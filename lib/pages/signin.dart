import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/usermodle.dart';
import '../untility/dailog.dart';
import '../untility/style.dart';
import '../untility/urldomein.dart';
import 'mainshop.dart';
import 'mianuser.dart';
import 'minrider.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  bool _loadnig = false;
  String? phone, pass;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('sign in'),
      ),
      body: Container(
        color: Colors.white,
        child: Form(
          key: formkey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  style().logo(),
                  style().title('ຍີນດີຕອນຮັບ'),
                  style().heightboxs(),
                  Container(
                    margin: const EdgeInsets.only(left: 35, right: 35),
                    child: Row(
                      children: [
                        style().lable('ເບີໂທລະສັບ'),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          onChanged: (value) => phone = value.trim(),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'ກາລຸນາປ້ອນຂໍ້ມູນ';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              prefixIcon: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 5),
                                    child: style().lable('+856'),
                                  )
                                ],
                              ),
                              hintText: '20...',
                              hintStyle: TextStyle(
                                  fontSize: 17, color: style().darkColor),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: style().darkColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: style().pimaryColor),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              focusColor: Colors.amber),
                        ),
                      ],
                    ),
                  ),
                  style().heightboxs(),
                  Container(
                    margin: const EdgeInsets.only(left: 35, right: 35),
                    child: Row(
                      children: [
                        style().lable('ລະຫັດຜ່ານ'),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          onChanged: (value) => pass = value.trim(),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'ກາລຸນາປ້ອນຂໍ້ມູນ';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: style().darkColor,
                              size: 22,
                            ),
                            hintText: '...',
                            hintStyle: TextStyle(
                                fontSize: 17, color: style().darkColor),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: style().darkColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: style().pimaryColor),
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
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: MaterialButton(
                            color: style().darkColor,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: _loadnig
                                  ? Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const CircularProgressIndicator(
                                            strokeWidth: 2.7,
                                            backgroundColor: Color.fromARGB(
                                                255, 255, 111, 0),
                                            color: Colors.white,
                                          ),
                                          style().widthboxs(),
                                          const Text(
                                            'ກຳລັງເຂົ້າສູ່ລະບົບ...',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    )
                                  : const Text(
                                      'ເຂົ້າສູ່ລະບົບ',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                            onPressed: () {
                              bool validate = formkey.currentState!.validate();
                              if (validate) {
                                _loadnig = true;
                                checkUser();
                              } else {
                                massageDialog(context, DialogType.warning,
                                    'ກະລຸນາປ້ອນຂໍ້ມູນໃຫ້ຄົບ');
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> checkUser() async {
    String url =
        '${urldomian().domain}/fastfoodapi/getUserWhereName.php?isAdd=true&phone=$phone';
    try {
      await Dio().get(url).then(
        (value) {
          var result = json.decode(value.data);
          if (result.toString() == 'null') {
            setState(
              () {
                massageDialog(context, DialogType.warning,
                    'ບໍ່ມີເບີນີ້ໃນລະບົບ ກະລຸນາລອງໃໝ່');
                _loadnig = false;
              },
            );
          } else {
            _loadnig = false;
            for (var map in result) {
              usermodel userModle = usermodel.fromJson(map);
              if (pass == userModle.pass) {
                String? choosType = userModle.choosetype;
                if (choosType == 'User') {
                  routePageSignin(context, const mianuser(), userModle);
                } else if (choosType == 'Shop') {
                  routePageSignin(context, const mainshop(), userModle);
                } else if (choosType == 'Rider') {
                  routePageSignin(context, const mainrider(), userModle);
                } else {
                  massageDialog(
                      context, DialogType.error, 'ລະບົບມີບັນຫາ ກະລຸນາລອງໃໝ່');
                }
              } else {
                setState(
                  () {
                    _loadnig = false;
                    massageDialog(context, DialogType.warning,
                        'ລະຫັດຜ່ານບໍ່ຖືກຕ້ອງ ກະລຸນາລອງໃໝ່');
                  },
                );
              }
            }
          }
        },
      );
    } catch (e) {}
  }
}
