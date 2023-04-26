// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../untility/style.dart';

class adshopinfo extends StatefulWidget {
  const adshopinfo({super.key});

  @override
  State<adshopinfo> createState() => _adshopinfoState();
}

class _adshopinfoState extends State<adshopinfo> {
  final formkey = GlobalKey<FormState>();
  bool _islaoding = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        title: const Text(
          'ເພີ່ມຂໍ້ມູນຮ້ານຄ້າ',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: formkey,
        child: ListView(
          children: [
            //image

            SizedBox(
              height: 260.0,
              width: 250.0,
              child: Stack(
                children: [
                  style().showMap(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.orange, width: 3),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(65),
                                ),
                              ),
                              margin: const EdgeInsets.only(top: 10, left: 10),
                              width: 130,
                              height: 130,
                              child: const CircleAvatar(
                                backgroundImage: AssetImage('images/res.jpeg'),
                                radius: 60,
                              )),
                        ],
                      ),
                    ],
                  ),
                  // button input poto
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              left: 85,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.orange,
                                  width: 2,
                                  style: BorderStyle.solid),
                            ),
                            width: 45,
                            height: 45,
                            child: FloatingActionButton(
                              backgroundColor: Colors.white,
                              child: const Icon(
                                Icons.add_a_photo,
                                color: Colors.orange,
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: SizedBox(
                                        height: 150,
                                        child: Column(
                                          children: [
                                            IconButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              icon: const Icon(
                                                Icons.arrow_drop_down_outlined,
                                                size: 30,
                                              ),
                                            ),
                                            // button take poto
                                            TextButton(
                                              child: Row(
                                                children: [
                                                  const Icon(Icons.add_a_photo),
                                                  style().widthboxs(),
                                                  const Text(
                                                    'ຖ່າຍພາບ',
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  ),
                                                ],
                                              ),
                                              onPressed: () {},
                                            ),
                                            // open gallery
                                            TextButton(
                                              child: Row(
                                                children: [
                                                  const Icon(Icons
                                                      .add_photo_alternate),
                                                  style().widthboxs(),
                                                  const Text(
                                                    'ນຳເຂົ້າຈາກ Gallery',
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  ),
                                                ],
                                              ),
                                              onPressed: () {},
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // text fied in put info
            style().heightboxs(),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 35, right: 35),
                  child: Row(
                    children: [
                      style().lable('ຊື່ຮ້ານຄ້າ'),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        style: TextStyle(color: style().darkColor),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'ກາລຸນາປ້ອນຂໍ້ມູນ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.account_box,
                              color: Colors.orange,
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
                      style().lable('ເບີໂທລະສັບ'),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        style: TextStyle(color: style().darkColor),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'ກາລຸນາປ້ອນຂໍ້ມູນ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.phone,
                              color: Colors.orange,
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
                      style().lable('ທີ່ຢູ່ຮ້ານຄ້າ'),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        style: TextStyle(color: style().darkColor),
                        maxLines: 4,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'ກາລຸນາປ້ອນຂໍ້ມູນ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
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
                            focusColor: Colors.amber),
                      ),
                    ],
                  ),
                ),
                style().heightboxs(),
              ],
            ),
            style().heightboxs(),
            //buttin save info
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
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
                                'ກຳລັງບັນທືກຂໍ້ມູນ...',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      : const Text(
                          'ບັນທືກຂໍ້ມູນ',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                ),
                onPressed: () {},
              ),
            ),
            style().heightboxs(),
          ],
        ),
      ),
    );
  }
}
