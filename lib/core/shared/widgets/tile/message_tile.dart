import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:untitled1/core/shared/classes/controller.dart';
import 'package:untitled1/core/shared/widgets/snackbar/snackBar.dart';
import 'package:untitled1/features/codex/controller.dart';
import 'package:untitled1/features/text/controller.dart';

Widget MessageTile({
  required BuildContext context,
  required int index,
  TextGPTController? textGPTController,
  CodexGPTController? codexGPTController,
  bool loading = false,
}) {
  AppController? currentController = textGPTController ?? codexGPTController;
  var isUser = currentController!.isUser(index);
  return ListTile(
    leading: isUser
        ? null
        : Image.asset(
            "assets/icons/favicon.ico",
            height: 40,
            width: 40,
          ),
    trailing: isUser
        ? const Icon(
            Icons.account_circle_sharp,
            size: 40,
            color: Colors.white,
          )

        ///for Download picture button (Images) or Copy to Clipboard button (Text)
        : !loading
            ? IconButton(
                icon: const Icon(Icons.copy_all),
                onPressed: () {
                  Clipboard.setData(ClipboardData(
                          text: currentController.messages[index].message!))
                      .then((_) {
                    snackBar('Copied to your clipboard.', context,
                        icon: const Icon(
                          Icons.check_circle_outline_outlined,
                          color: Colors.white,
                        ));
                  });
                },
                color: Colors.white54,
                iconSize: 35,
              )
            : null,
    title: Padding(
      // asymmetric padding
      padding: loading
          ? const EdgeInsets.only(right: 220)
          : EdgeInsets.fromLTRB(
              isUser ? 60.0 : 5.0,
              4,
              isUser ? 5.0 : 0.0,
              4,
            ),
      child: Align(
        // align the child within the container
        alignment: isUser ? Alignment.centerRight : Alignment.topLeft,
        child: DecoratedBox(
          // chat bubble decoration
          decoration: BoxDecoration(
            color: isUser ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: loading
                ? const EdgeInsets.symmetric(vertical: 15, horizontal: 0)
                : const EdgeInsets.all(10),
            child: loading
                ? const JumpingDots(
                    color: Colors.black87,
                    radius: 5,
                    innerPadding: 2,
                  )
                : Text(
                    textAlign: TextAlign.start,
                    currentController.messages[index].message!.trimLeft(),
                    style: TextStyle(
                        color: isUser ? Colors.white : Colors.black87),
                  ),
          ),
        ),
      ),
    ),
  );
}
