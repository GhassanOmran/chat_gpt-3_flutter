import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:untitled1/core/constants/api.dart';
import 'package:untitled1/core/models/text_and_code/text_response.dart';

TextRepository textRepository = Get.find();

class TextRepository extends GetxService {
  TextRepository();

  Future<String?> getTextData({
    required String message,
    required String modelName,
    required int numTokens,
  }) async {
    var url = Uri.parse("$baseUrl/completions");

    var response = await http.post(url,
        body: jsonEncode({
          'model': modelName,
          'prompt': message,
          'temperature': 0,
          'max_tokens': numTokens,
          'top_p': 0,
        }),
        headers: {
          'Authorization': 'Bearer $secretKey',
          'content-type': 'application/json',
        });

    if (response.statusCode == 200) {
      TextResponse textResponse = textResponseFromJson(response.body);
      print('body:  ${response.body}');
      print('choice:  ${textResponse.choices}');
      return textResponse.choices?.elementAt(0).text;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return 'please try again';
  }
}
