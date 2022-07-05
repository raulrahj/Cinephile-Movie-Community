import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/material.dart';
import 'package:open_box/data/models/user/m_user.dart';

class SharedService {
  // ignore: non_constant_identifier_names
  static String LOGIN_KEY = "login_details";
  static Future<void> setLoginDetails(UserData loginData) async {
    APICacheDBModel cacheModel = APICacheDBModel(
      key: LOGIN_KEY,
      syncData: jsonEncode(loginData.toJson()),
    );

    await APICacheManager().addCacheData(cacheModel);
  }

  static Future<void> logout(BuildContext context) async {
    await APICacheManager().deleteCache(LOGIN_KEY);
    // ignore: use_build_context_synchronously
    Navigator.pushNamedAndRemoveUntil(
      context,
      "/login",
      (route) => false,
    );
  }

  static Future<bool> isLoggedIn() async {
    final isLoggedIn = await APICacheManager().isAPICacheKeyExist("login_details");
    
    return isLoggedIn;
  }

  static Future<UserData?> getUserProfile() async {
    final isLoggedIn =
        await APICacheManager().isAPICacheKeyExist("login_details");
    if (isLoggedIn) {
      final userData = await APICacheManager().getCacheData(LOGIN_KEY);
      return userDataFromJson(jsonEncode(userData));
    } else {
      return null;
    }
  }
}
