import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/core/shared/classes/message.dart';
import 'package:untitled1/core/shared/classes/message_type.dart';

abstract class AppController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  RxList<Message> messages = <Message>[].obs;
  RxBool loading = false.obs;
  Rx<ScrollController>? scrollController = ScrollController().obs;

  void addMessage() {
    messages.add(Message(
        message: textEditingController.text, messageOwner: MessageType.user));
    messages.add(Message(message: '', messageOwner: MessageType.bot));
    scrollDown();
    getResponse(textEditingController.text);
    textEditingController.clear();
  }

  scrollDown() {
    scrollController!.value.animateTo(
      scrollController!.value.position.maxScrollExtent,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
    );
  }

  bool isUser(int index) {
    return messages.elementAt(index).messageOwner == MessageType.user;
  }

  getResponse(String message);
}
