import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/core/shared/widgets/appbar/custom_appbar.dart';
import 'package:untitled1/core/shared/widgets/textfiled/textField_with_submit.dart';
import 'package:untitled1/core/shared/widgets/tile/message_tile.dart';
import 'package:untitled1/features/text/settings/index.dart';
import 'controller.dart';

class TextGPTPage extends StatelessWidget {
  const TextGPTPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextGPTController textGPTController = Get.find();
    return Scaffold(
      appBar: appbar(text: 'Text', screen: TextSettingsPage()),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
            Obx(
              () => Expanded(
                child: ListView.builder(
                  controller: textGPTController.scrollController!.value,
                  itemBuilder: (context, index) {
                    if (index == textGPTController.messages.length - 1 &&
                        textGPTController.loading.isTrue) {
                      return MessageTile(
                          context: context,
                          index: index,
                          textGPTController: textGPTController,
                          loading: true);
                    } else {
                      return MessageTile(
                          context: context,
                          index: index,
                          textGPTController: textGPTController);
                    }
                  },
                  itemCount: textGPTController.messages.length,
                ),
              ),
            ),
            TextFieldWithSubmit(
                textEditingController: textGPTController.textEditingController,
                function: () {
                  if (textGPTController.textEditingController.text.isNotEmpty) {
                    textGPTController.addMessage();
                  }
                  FocusScope.of(context).unfocus();
                }),
          ],
        ),
      ),
    );
  }
}
