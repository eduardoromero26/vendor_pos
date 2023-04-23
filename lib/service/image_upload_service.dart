import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:vendor_pos/service/base_Api/base_api.dart';

class ImageUploadService with BaseApi {
  Future<List<String>> uploadImages(List<XFile> images) async {
    List<String> uploadedImagePaths = [];

    final response = await executeHttpRequest(
      urlMethod: 'wp-json/wp/v2/media',
      method: HttpMethod.POST,
      body: await _createRequestBody(images),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseBody = json.decode(response.body);
      uploadedImagePaths = List<String>.from(responseBody["data"]["path"]);
    } else {
      throw Exception(
          'Failed to upload images. Status code: ${response.statusCode}');
    }

    return uploadedImagePaths;
  }

  Future<Map<String, dynamic>> _createRequestBody(List<XFile> images) async {
    Map<String, dynamic> requestBody = {};
    int index = 0;

    for (final image in images) {
      final imageBytes = await image.readAsBytes();
      String base64Image = base64Encode(imageBytes);
      requestBody['image_$index'] = base64Image;
      index++;
    }

    return requestBody;
  }
}
