import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/core/models/image_generator/image_generator_response.dart';
import 'package:untitled1/core/repositories/get_images_data_repository.dart';
import 'package:untitled1/core/shared/classes/controller.dart';
import 'package:untitled1/core/shared/classes/message.dart';
import 'package:untitled1/core/shared/classes/message_type.dart';
import 'package:gallery_saver/gallery_saver.dart';

import '../../core/shared/widgets/snackbar/snackBar.dart';

class ImageGeneratorController extends AppController {
  RxString selectedSize = ''.obs;
  RxInt numPhotos = 1.obs;
  TextEditingController numberofPhotosEditingController =
      TextEditingController();
  List<DropdownMenuItem<String>> sizeList = [
    const DropdownMenuItem(
      value: "256x256",
      child: Text("256x256"),
    ),
    const DropdownMenuItem(
      value: "512x512",
      child: Text("512x512"),
    ),
    const DropdownMenuItem(
      value: "1024x1024",
      child: Text("1024x1024"),
    ),
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    selectedSize(sizeList.elementAt(1).value);
    numberofPhotosEditingController.text = 1.toString();
  }

  @override
  getResponse(String message) async {
    loading.value = true;
    List<Data>? botAnswer = await imagesRepository.getImageGenerationsData(
        message: message, numPhotos: numPhotos.value, size: selectedSize.value);
    loading.value = false;
    messages.removeLast();
    for (var element in botAnswer!) {
      messages
          .add(Message(message: element.url, messageOwner: MessageType.bot));
    }
    scrollDown();
  }

  Future<bool> downloadCurrentImage(int index, BuildContext context) async {
    String url = messages.elementAt(index).message!;
    snackBar('Downloading...', context);
    try {
      await GallerySaver.saveImage(url);
      return true;
    } catch (e) {
      return false;
    }
  }

  void changeSize(String? value) {
    selectedSize(value);
  }

  void saveSettings(BuildContext context) {
    if (int.parse(numberofPhotosEditingController.text) >= 1 &&
        int.parse(numberofPhotosEditingController.text) <= 10) {
      numPhotos(int.parse(numberofPhotosEditingController.text));
      Get.back();
      snackBar('Settings Saved.', context,
          icon: const Icon(
            Icons.check_circle_outline_outlined,
            color: Colors.white,
          ),
          backgroundColor: Colors.green);
    } else {
      snackBar('Please input number in range.', context,
          icon: const Icon(
            Icons.error,
            color: Colors.white,
          ),
          backgroundColor: Colors.red);
    }
  }
}
