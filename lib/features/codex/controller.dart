import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/core/constants/gpt_models.dart';
import 'package:untitled1/core/repositories/get_code_data_repository.dart';
import 'package:untitled1/core/shared/classes/controller.dart';
import 'package:untitled1/core/models/text_and_code/gpt_model.dart';
import 'package:untitled1/core/shared/classes/message.dart';
import 'package:untitled1/core/shared/widgets/snackbar/snackBar.dart';
import '../../core/shared/classes/message_type.dart';

class CodexGPTController extends AppController {
  GptModel? selectedModel;
  RxString selectedModelName = ''.obs;
  TextEditingController tokenEditingController = TextEditingController();

  List<DropdownMenuItem<String>> modelList = [
    const DropdownMenuItem(
      value: "code-davinci-002",
      child: Text("code-davinci-002"),
    ),
    const DropdownMenuItem(
      value: "code-cushman-001",
      child: Text("code-cushman-001"),
    ),
  ];

  List<GptModel>? models = listAllModels['codex-models'];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    selectedModel = models!.first;
    selectedModelName(selectedModel!.name);
    tokenEditingController.text = selectedModel!.tokens.toString();
  }

  @override
  getResponse(String message) async {
    loading.value = true;
    String? botAnswer = await codeRepository.getCodeData(
        message: message,
        modelName: selectedModel!.name!,
        numTokens: selectedModel!.tokens!);
    loading.value = false;
    messages.removeLast();
    messages.add(Message(message: botAnswer!, messageOwner: MessageType.bot));
    scrollDown();
  }

  void changeModel(String? value) {
    selectedModel = models!.firstWhere((element) => element.name == value);
    selectedModelName(selectedModel!.name);
    tokenEditingController.text = selectedModel!.tokens.toString();
  }

  void saveSettings(BuildContext context) {
    if (int.parse(tokenEditingController.text) >= 100 &&
        int.parse(tokenEditingController.text) <= selectedModel!.maxToken!) {
      selectedModel!.tokens = int.parse(tokenEditingController.text);
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
