import 'package:flutter/material.dart';

Widget builditem(String modelName, String content) {
  return ExpansionTile(
    title: Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Text(
        modelName,
        style: const TextStyle(
            fontSize: 18, height: 1.5, fontWeight: FontWeight.w700),
      ),
    ),
    children: [
      Container(
          padding: const EdgeInsets.only(left: 45, right: 15, bottom: 15),
          child: Text(
            content,
            style: const TextStyle(
              fontSize: 16,
              height: 1.5,
            ),
          )),
    ],
  );
}
