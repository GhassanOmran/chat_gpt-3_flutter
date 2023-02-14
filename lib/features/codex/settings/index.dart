import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/core/shared/widgets/textfiled/textFiled_tokens.dart';
import 'package:untitled1/features/codex/controller.dart';

class CodeSettingsPage extends StatelessWidget {
  CodexGPTController codexGPTController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Code Settings"),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () => codexGPTController.saveSettings(context),
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
                  title: const Text("Code Model"),
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
                    items: codexGPTController.modelList,
                    value: codexGPTController.selectedModelName.value,
                    onChanged: (value) {
                      codexGPTController.changeModel(value);
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
                        'min 100~${codexGPTController.selectedModel!.maxToken} max',
                        style: const TextStyle(
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                  trailing: buildTokensTextfield(
                    textEditingController:
                        codexGPTController.tokenEditingController,
                  )),
            ],
          )),
    );
  }
}
