import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/core/shared/widgets/textfiled/textFiled_tokens.dart';
import 'package:untitled1/features/image_generator/controller.dart';

class ImageSettingsPage extends StatelessWidget {
  ImageGeneratorController imageGeneratorController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Images Settings"),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () => imageGeneratorController.saveSettings(context),
            child: const SizedBox(
              width: 60,
              child: Center(
                  child: Text(
                'Save',
                style: TextStyle(fontSize: 20),
              )),
            ),
          )
        ],
      ),
      body: Obx(() => ListView(
            children: [
              ListTile(
                  leading: const Icon(Icons.model_training),
                  title: const Text("Size of images"),
                  trailing: DropdownButton<String>(
                    hint: const Text('Select an item'),
                    icon: const Icon(Icons.arrow_drop_down_rounded),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    underline: Container(
                      height: 1,
                      color: Colors.black,
                    ),
                    items: imageGeneratorController.sizeList,
                    value: imageGeneratorController.selectedSize.value,
                    onChanged: (value) {
                      imageGeneratorController.changeSize(value);
                    },
                  )),
              ListTile(
                  leading: const Icon(Icons.numbers),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Number of Images",
                      ),
                      Text(
                        "min 1~10 max",
                        style: TextStyle(fontSize: 8),
                      ),
                    ],
                  ),
                  trailing: buildTokensTextfield(
                    maxlength: 2,
                    textEditingController: imageGeneratorController
                        .numberofPhotosEditingController,
                  )),
            ],
          )),
    );
  }
}
