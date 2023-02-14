import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:untitled1/core/constants/colors.dart';
import 'package:untitled1/core/shared/widgets/snackbar/snackBar.dart';
import 'package:untitled1/core/shared/widgets/view_image.dart';
import 'package:untitled1/features/image_generator/controller.dart';

Widget imageTile({
  required BuildContext context,
  required int index,
  ImageGeneratorController? imageGeneratorController,
  bool loading = false,
}) {
  var isUser = imageGeneratorController!.isUser(index);
  var currentMessage = imageGeneratorController.messages[index].message!;
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
        : !loading
            ? IconButton(
                icon: const Icon(Icons.download),
                onPressed: () {
                  imageGeneratorController
                      .downloadCurrentImage(index, context)
                      .then((value) => snackBar('Image Saved.', context,
                          icon: const Icon(
                            Icons.check_circle_outline_outlined,
                            color: Colors.white,
                          )));
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
                : !isUser
                    ? InkWell(
                        child: CachedNetworkImage(
                          height: 200,
                          width: 230,
                          key: UniqueKey(),
                          imageUrl: currentMessage,
                          progressIndicatorBuilder: (_, url, download) {
                            if (download.progress != null) {
                              final precent = download.progress! * 100;
                              return CircularPercentIndicator(
                                  progressColor: backgroundColor,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  radius: 40.0,
                                  lineWidth: 5.0,
                                  animation: false,
                                  percent: download.progress!,
                                  center: Text(
                                    precent.toStringAsFixed(1),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0),
                                  ));
                            }
                            return const Center(child: Text('loading'));
                          },
                        ),
                        onTap: () {
                          Get.to(() => viewImage(currentMessage),
                              transition: Transition.zoom);
                        })
                    : Text(
                        textAlign: TextAlign.start,
                        currentMessage.trimLeft(),
                        style: TextStyle(
                            color: isUser ? Colors.white : Colors.black87),
                      ),
          ),
        ),
      ),
    ),
  );
}
