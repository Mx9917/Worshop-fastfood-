import 'package:fastfood/untility/style.dart';
import 'package:flutter/material.dart';

import '../pages/addshopinfo.dart';
import '../untility/dailog.dart';

class shopinfo extends StatefulWidget {
  const shopinfo({super.key});

  @override
  State<shopinfo> createState() => _shopinfoState();
}

class _shopinfoState extends State<shopinfo> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        style().titlecenter(context, 'ຍັງບໍ່ມີຂໍ້ນຮ້ານ ກະລຸນາເພີ່ມຂໍ້ນດ້ວຍ'),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        pushPages(context, const adshopinfo());
                      }),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
