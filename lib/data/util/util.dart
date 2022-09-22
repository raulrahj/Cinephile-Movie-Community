import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import "package:http_parser/http_parser.dart";
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/data/core/api_end_points.dart';
import 'package:open_box/data/models/user/m_cloud_image.dart';

class UtilRepo {
  static Future<File?> _cropImage(File? photo) async {
    File? image;
    if (photo != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: photo.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Crop',
              toolbarColor: kBlack,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
        ],
      );
      if (croppedFile != null) {
        // setState(() {
        image = File(croppedFile.path);
        // });
        return image;
      } else {
        return null;
      }
    }
    return null;
  }

  static Future<File?> pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    File? image;
    File? selectedImg;
    await showDialog(
        context: context,
        builder: (ctx) {
          return SimpleDialog(
            // alignment: Alignment.bottomCenter,
            title: const Text('open'),
            contentPadding: const EdgeInsets.fromLTRB(24.0, 12.0, 5.0, 16.0),
            children: [
              Row(
                children: [
                  TextButton.icon(
                    icon: const CircleAvatar(
                      backgroundColor: kRed,
                      child: Icon(
                        Icons.camera_alt,
                        color: kWhite,
                      ),
                    ),
                    label: const Text("Camera"),
                    onPressed: () async {
                      try {
                        final XFile? photo =
                            await picker.pickImage(source: ImageSource.camera);
                        if (photo != null) {
                          image = await _cropImage(File(photo.path));
                          if (image != null) {
                            selectedImg = image;
                            // _uploadImage(image!);
                          } else {
                            selectedImg = File(photo.path);
                            // _uploadImage(File(photo.path));
                          }
                        }
                      } catch (e) {
                        // debugPrint(e.toString());
                      }
                    },
                  ),
                ],
              ),
              // kHeight1,
              Row(
                children: [
                  TextButton.icon(
                    icon: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.photo_library_outlined,
                        color: kWhite,
                      ),
                    ),
                    label: const Text("Gallery"),
                    onPressed: () async {
                      try {
                        final XFile? photo = await picker.pickImage(
                          source: ImageSource.gallery,
                        );
                        if (photo != null) {
                          image = await _cropImage(File(photo.path));
                          if (image != null) {
                            selectedImg = image;
                          } else {
                            selectedImg = File(photo.path);
                          }
                        }
                      } catch (e) {
                        debugPrint(e.toString());
                      }
                    },
                  ),
                ],
              ),
            ],
          );
        });
    return selectedImg;
  }

  static Future<String?> uploadImage(File image) async {
    Dio dio = Dio();
    String imageUrl = '';
    String fileName =
        DateTime.now().toString().replaceAll(RegExp(r'[^0-9]+'), '') +
            image.path.split('/').last;
    FormData formData = FormData.fromMap({
      // "name": fileName,
      "upload_preset": "cinephile",
      "cloud_name": "dpzy031nr",
      "file": await MultipartFile.fromFile(
        image.path,
        filename: fileName,
        contentType: MediaType('image', 'jpg'),
      ),
      // "type": "image/jpg",
    });
    Map<String, String> requestHeaders = {
      "Content-Type": 'multipart/form-data',
      // 'Authorization': ''
    };
//     var stream =
// http.ByteStream(DelegatingStream.typed(image.openRead()));
    try {
      log('Upload Image try block');
      final response = await dio.post(
         ApiEndPoints.imgUpload,
          data: formData,
          options: Options(headers: requestHeaders));
      log('Response got');

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('Image Uploaded !!!');
        final res = jsonEncode(response.data);
        final imageData = cloudImageFromJson(res);
        imageUrl = imageData.secureUrl;
        return imageUrl;
      } else {
        debugPrint(response.statusMessage);
      }
    } on DioError catch (e) {
      log(e.message);
      log('Status Code ${e.response}');
    } catch (e) {
      log(e.toString());
    }
    return imageUrl;
  }
}

class Glass extends StatelessWidget {
  const Glass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: const FlutterLogo()),
          Center(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(0.5),
                  ),
                  child: Center(
                    child: Text('Frosted',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
