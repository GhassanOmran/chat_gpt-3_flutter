import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashGPTPage extends StatefulWidget {
  const SplashGPTPage({Key? key}) : super(key: key);

  @override
  State<SplashGPTPage> createState() => _SplashGPTPageState();
}

class _SplashGPTPageState extends State<SplashGPTPage>
    with SingleTickerProviderStateMixin {
  late AnimationController lottieController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lottieController =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);

    lottieController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        lottieController.reset();
      }
    });
  }

  @override
  void dispose() {
    lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/icons/robotAnimation.json",
                animate: true,
                controller: lottieController, onLoaded: (composition) {
              lottieController.duration = composition.duration;
              lottieController.forward();
            }),
            SizedBox(
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
          ],
        ),
      ),
    );
  }
}
