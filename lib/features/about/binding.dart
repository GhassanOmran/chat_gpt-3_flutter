import 'package:get/get.dart';

import 'controller.dart';

class AboutPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutController>(() => AboutController());
  }
}
