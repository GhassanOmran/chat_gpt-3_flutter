import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/core/models/image_generator/image_generator_response.dart';
import '../constants/api.dart';

ImagesRepository imagesRepository = Get.find();

class ImagesRepository extends GetxService {
  ImagesRepository();
  Future<List<Data>?> getImageGenerationsData(
      {required String message,
      required String size,
      required int numPhotos}) async {
    var url = Uri.parse("$baseUrl$imageGenerations");

    var response = await http.post(url,
        body: jsonEncode({
          "prompt": message,
          "n": numPhotos,
          "size": size,
          "response_format": "url"
        }),
        headers: {
          'Authorization': 'Bearer $secretKey',
          'content-type': 'application/json',
        });

    if (response.statusCode == 200) {
      ImageGeneratorResponse imageGeneratorResponse =
          imageGeneratorResponseFromJson(response.body);
      print('body:  ${response.body}');
      print('choice:  ${imageGeneratorResponse.data}');
      return imageGeneratorResponse.data;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return null;
  }
}
