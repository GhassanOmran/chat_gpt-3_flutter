import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/core/constants/colors.dart';
import 'controller.dart';

class HomeGPTPage extends StatelessWidget {
  const HomeGPTPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeGPTController homeGPTController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 35,
                width: 35,
                child: Image.asset('assets/icons/white Icon.png')),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Chat GPT',
              style: TextStyle(fontFamily: 'Raleway'),
            ),
          ],
        )),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.1,
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                      'Welcome To Chat GPT is a chatbot launched by OpenAI',
                      textAlign: TextAlign.center,
                      textStyle: const TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 20,
                        color: Colors.white,
                      )),
                ],
                totalRepeatCount: 1,
                pause: const Duration(milliseconds: 500),
              ),
            ),
          ),
          Expanded(
            child: Container(
                padding: const EdgeInsets.only(top: 70.0, left: 15, right: 15),
                child: GridView.builder(
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15.0,
                      mainAxisSpacing: 15.0),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      child: Container(
                          decoration: const BoxDecoration(
                              color: botBackgroundColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Center(
                              child: Text(
                            textAlign: TextAlign.center,
                            homeGPTController.pages.values.elementAt(index),
                            style: Theme.of(context).textTheme.displayLarge,
                          ))),
                      onTap: () {
                        Navigator.pushNamed(context,
                            homeGPTController.pages.keys.elementAt(index));
                      },
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
