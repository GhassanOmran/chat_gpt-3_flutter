import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/core/constants/gpt_models.dart';
import 'package:untitled1/core/models/text_and_code/gpt_model.dart';
import 'package:untitled1/core/repositories/get_text_data_repository.dart';
import 'package:untitled1/core/shared/classes/message.dart';
import 'package:untitled1/core/shared/classes/message_type.dart';
import 'package:untitled1/core/shared/widgets/snackbar/snackBar.dart';
import '../../core/shared/classes/controller.dart';

class TextGPTController extends AppController {
  GptModel? selectedModel;
  RxString selectedModelName = ''.obs;
  TextEditingController tokenEditingController = TextEditingController();

  List<DropdownMenuItem<String>> model_list = [
    const DropdownMenuItem(
      value: "text-davinci-003",
      child: Text("text-davinci-003"),
    ),
    const DropdownMenuItem(
      value: "text-curie-001",
      child: Text("text-curie-001"),
    ),
    const DropdownMenuItem(
      value: "text-babbage-001",
      child: Text("text-babbage-001"),
    ),
    const DropdownMenuItem(
      value: "text-ada-001",
      child: Text("text-ada-001"),
    ),
  ];

  List<GptModel>? models = listAllModels['text-models'];
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
    String? botAnswer = await textRepository.getTextData(
        message: message,
        modelName: selectedModel!.name!,
        numTokens: selectedModel!.tokens!);
    loading.value = false;
    messages.removeLast();
    messages.add(Message(message: botAnswer!, messageOwner: MessageType.bot));
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
