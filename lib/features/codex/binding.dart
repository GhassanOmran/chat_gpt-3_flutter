import 'package:get/get.dart';
import 'package:untitled1/core/repositories/get_code_data_repository.dart';
import 'controller.dart';

class CodexGPTPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodexGPTController>(() => CodexGPTController());
    Get.put(CodeRepository());
  }
}
