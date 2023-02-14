import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/core/shared/widgets/appbar/custom_appbar.dart';

import 'package:untitled1/core/shared/widgets/textfiled/textField_with_submit.dart';
import 'package:untitled1/core/shared/widgets/tile/image_tile.dart';
import 'package:untitled1/features/image_generator/controller.dart';
import 'package:untitled1/features/image_generator/settings/index.dart';

class ImageGeneratorPage extends StatelessWidget {
  const ImageGeneratorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImageGeneratorController imageGeneratorController = Get.find();
    return Scaffold(
      appBar: appbar(text: 'Image Generator', screen: ImageSettingsPage()),
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: ListView.builder(
                controller: imageGeneratorController.scrollController!.value,
                itemBuilder: (context, index) {
                  if (index == imageGeneratorController.messages.length - 1 &&
                      imageGeneratorController.loading.isTrue) {
                    return imageTile(
                        context: context,
                        index: index,
                        imageGeneratorController: imageGeneratorController,
                        loading: true);
                  } else {
                    return imageTile(
                        context: context,
                        index: index,
                        imageGeneratorController: imageGeneratorController);
                  }
                },
                itemCount: imageGeneratorController.messages.length,
              ),
            ),
          ),
          TextFieldWithSubmit(
              textEditingController:
                  imageGeneratorController.textEditingController,
              function: () {
                if (imageGeneratorController
                    .textEditingController.text.isNotEmpty) {
                  imageGeneratorController.addMessage();
                }
                imageGeneratorController.textEditingController.clear();
                FocusScope.of(context).unfocus();
              }),
        ],
      ),
    );
  }
}
