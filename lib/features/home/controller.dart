import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/core/shared/classes/message.dart';

class HomeGPTController extends GetxController {
  final Map<String, String> pages = <String, String>{
    '/text': 'Text',
    '/codex': 'Code',
    '/imageGenerator': 'Image Generator',
    '/about': 'About'
  };

  @override
  void onInit() {
    // ignore: todo
    // TODO: implement onInit
    super.onInit();
  }
}
