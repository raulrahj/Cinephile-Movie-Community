import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:open_box/config/strings.dart';
import 'package:open_box/data/models/user/m_user.dart';

class SearchRepo {
  final dio = Dio(BaseOptions(baseUrl: 'localhost:5000'));
  Map<String, String> requestHeaders = {
    'Content-Type': 'application/json',
    'Authorization': ''
  };
  Future<List<UserModel>>? getAllUser() async {
    List<UserModel>? retrievedUser;
    try {
      Response response = await dio.get("$kApiUrl/user");
      if (response.statusCode == 200 || response.statusCode == 201) {
        // log(response.data.toString());
        final res = jsonEncode(response.data);
        retrievedUser = userModelFromJson(res);
        return retrievedUser;
      } else {}
    } catch (e) {
      log(e.toString());
    }
    return retrievedUser!;
  }
}
