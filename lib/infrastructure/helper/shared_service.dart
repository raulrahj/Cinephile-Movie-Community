import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/material.dart';
import 'package:open_box/data/models/user/m_profile.dart';

class SharedService {
  // ignore: non_constant_identifier_names
  static String LOGIN_KEY = "login_details";
  static Future<void> setLoginDetails(ProfileModel loginData) async {
    APICacheDBModel cacheModel = APICacheDBModel(
      key: LOGIN_KEY,
      syncData: jsonEncode(loginData.toJson()),
    );

    await APICacheManager().addCacheData(cacheModel);
    debugPrint("LOGIN AND DATA ADDED SUCCESFULLY");
    debugPrint(loginData.user!.username);
  }

  static Future<void> logout(BuildContext context) async {
    await APICacheManager().deleteCache(LOGIN_KEY);
    debugPrint('LOG OUT AND DATA CLEARED !!!');
    // ignore: use_build_context_synchronously
    Navigator.pushNamedAndRemoveUntil(
      context,
      "/login",
      (route) => false,
    );
  }

  static Future<bool> isLoggedIn() async {
    final isLoggedIn = await APICacheManager().isAPICacheKeyExist(LOGIN_KEY);

    return isLoggedIn;
  }

  static Future<ProfileModel?> getUserProfile() async {
    final isLoggedIn = await APICacheManager().isAPICacheKeyExist(LOGIN_KEY);
    if (isLoggedIn) {
      final userData = await APICacheManager().getCacheData(LOGIN_KEY);

      return profileModelFromJson(userData.syncData);
    } else {
      return null;
    }
  }
}
