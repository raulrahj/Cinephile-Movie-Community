import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_box/data/core/api_end_points.dart';
import 'package:open_box/data/models/chat/m_chat.dart';
import 'package:open_box/data/models/chat/m_message.dart';
import 'package:open_box/data/util/dio_client.dart';
import 'package:open_box/view/chat_screen/inbox_screen.dart';

class ChatRepo {
  Future createChat({required ChatModel chat}) async {
    try {
      final body = chatModelToJson(chat);
      Response response =
          await DioClient().post(ApiEndPoints.chat, '', jsonEncode(body));
      log(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ChatTypes> userChats({required String userId}) async {
    ChatTypes types = ChatTypes(groupChat: [], perSonalChat: []);
    try {
      var response = await DioClient().get(
        ApiEndPoints.chat,
        userId,
      );
      // streamController.add(response.data);
      final data = jsonEncode(response);
      final res = chatsModelFromJson(data);
      types = ChatTypes(groupChat: [], perSonalChat: []);
      for (ChatsModel element in res) {
        if (element.members.length <= 2) {
          types.perSonalChat!.add(element);
        } else {
          types.groupChat!.add(element);
        }
      }
      // return types;

      debugPrint('CONVERSION SUCCESSFULL');
      return types;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MessageModel>> findChat(
      {required String userId, required String clientId}) async {
    List<MessageModel> list;

    try {
      Response response = await DioClient().get(
        ApiEndPoints.chat,
        "$userId,$clientId",
      );
      final res = jsonEncode(response);
      list = messageModelFromJson(res);
      // list = data;
      return list;
    } catch (e) {
      rethrow;
    }
  }

  Future addMessage({required MessageModel message}) async {
    try {
      final body = message.toJson();
      await DioClient().post(ApiEndPoints.message, '', (body));
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MessageModel>> getMessages({required String chatId}) async {
    List<MessageModel> list;
    try {
      var response = await DioClient().get(
        "${ApiEndPoints.message}/",
        chatId,
      );
      final res = jsonEncode(response);
      final data = messageModelFromJson(res);
      debugPrint("MESSAGE CONVERSION SUCCESSFULL");
      list = data;
      return list;
    } catch (e) {
      rethrow;
    }
  }
}
