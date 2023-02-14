import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar appbar({required String text, required Widget screen}) {
  return AppBar(
    centerTitle: true,
    title: Text(text, style: const TextStyle(fontFamily: 'Raleway')),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: InkWell(
            onTap: () =>
                Get.to(() => screen, transition: Transition.rightToLeft),
            child: const Icon(
              Icons.settings,
            )),
      )
    ],
  );
}
