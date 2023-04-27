import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:vendor_pos/main.dart';
import 'package:vendor_pos/service/base_Api/wordpress_base_api.dart';

class ImageUploadService with WordpressBaseApi {
  Future<String> uploadImage(XFile image, String fileName) async {
    String uploadedImagePath = '';

    try {
      final requestBody = await _createRequestBody(image);
      final customRequest = http.MultipartRequest(
        'POST',
        Uri.parse('${env!['WORDPRESS_URL']}wp-json/wp/v2/media'),
      );

      customRequest.files.add(requestBody);

      final response = await executeHttpRequest(
        urlMethod: 'wp-json/wp/v2/media',
        method: HttpMethod.POST,
        customRequest: customRequest,
      );

      var responseBody = json.decode(response.body);
      print('Response from server: $responseBody');

      if (responseBody != null &&
          responseBody["guid"] != null &&
          responseBody["guid"]["rendered"] != null) {
        uploadedImagePath = responseBody["guid"]["rendered"];
      } else {
        throw Exception('Invalid response from server');
      }
    } on WordpressBaseApi catch (e) {}

    return uploadedImagePath;
  }

  Future<http.MultipartFile> _createRequestBody(XFile image) async {
    final bytes = await image.readAsBytes();
    final multipartFile = http.MultipartFile.fromBytes(
      'file',
      bytes,
      filename: 'image.jpg',
    );
    return multipartFile;
  }
}
