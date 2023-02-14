import 'package:get/get.dart';
import 'package:untitled1/core/repositories/get_images_data_repository.dart';
import 'controller.dart';

class ImageGeneratorPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImageGeneratorController>(() => ImageGeneratorController());
    Get.put(ImagesRepository());
  }
}
