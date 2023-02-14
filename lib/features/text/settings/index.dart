import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/core/shared/widgets/textfiled/textFiled_tokens.dart';
import 'package:untitled1/features/text/controller.dart';

class TextSettingsPage extends StatelessWidget {
  TextGPTController textGPTController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Settings"),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () => textGPTController.saveSettings(context),
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
                  title: const Text("Text Model"),
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
                    items: textGPTController.model_list,
                    value: textGPTController.selectedModelName.value,
                    onChanged: (value) {
                      textGPTController.changeModel(value);
                    },
                  )),
              ListTile(
                  leading: const Icon(Icons.numbers),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Number of words",
                      ),
                      Text(
                        'min 100~${textGPTController.selectedModel!.maxToken} max',
                        style: const TextStyle(
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                  trailing: buildTokensTextfield(
                    textEditingController:
                        textGPTController.tokenEditingController,
                  )),
            ],
          )),
    );
  }
}
