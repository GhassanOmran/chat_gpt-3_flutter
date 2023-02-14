import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:untitled1/core/shared/widgets/appbar/custom_appbar.dart';
import 'package:untitled1/core/shared/widgets/textfiled/textField_with_submit.dart';
import 'package:untitled1/core/shared/widgets/tile/message_tile.dart';
import 'package:untitled1/features/codex/settings/index.dart';

import '../text/settings/index.dart';
import 'controller.dart';

class CodexGPTPage extends StatelessWidget {
  const CodexGPTPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CodexGPTController codexGPTController = Get.find();
    return Scaffold(
      appBar: appbar(text: 'Code', screen: CodeSettingsPage()),
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: ListView.builder(
                controller: codexGPTController.scrollController!.value,
                itemBuilder: (context, index) {
                  if (index == codexGPTController.messages.length - 1 &&
                      codexGPTController.loading.isTrue) {
                    return MessageTile(
                        context: context,
                        index: index,
                        codexGPTController: codexGPTController,
                        loading: true);
                  } else {
                    return MessageTile(
                        context: context,
                        index: index,
                        codexGPTController: codexGPTController);
                  }
                },
                itemCount: codexGPTController.messages.length,
              ),
            ),
          ),
          TextFieldWithSubmit(
              textEditingController: codexGPTController.textEditingController,
              function: () {
                if (codexGPTController.textEditingController.text.isNotEmpty) {
                  codexGPTController.addMessage();
                }
                FocusScope.of(context).unfocus();
              }),
        ],
      ),
    );
  }
}
