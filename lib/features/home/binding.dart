import 'package:get/get.dart';
import 'controller.dart';

class HomeGPTPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeGPTController>(() => HomeGPTController());
  }
}
