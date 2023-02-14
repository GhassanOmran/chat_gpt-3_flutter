import 'package:get/get.dart';
import 'package:untitled1/core/repositories/get_text_data_repository.dart';
import 'controller.dart';

class TextGPTPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TextGPTController>(() => TextGPTController());
        Get.put(TextRepository());
  }
}
