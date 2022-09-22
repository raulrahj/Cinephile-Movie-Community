import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_box/data/core/api_end_points.dart';
import 'package:open_box/data/models/chat/m_chat.dart';
import 'package:open_box/data/models/chat/m_message.dart';
import 'package:open_box/data/util/dio_client.dart';
import 'package:open_box/infrastructure/helper/shared_service.dart';
import 'package:open_box/logic/cubit/chat/chat_cubit.dart';
import 'package:open_box/view/chat_screen/inbox_screen.dart';

class ChatRepo {
  Future<ChatModel> createChat({required String recieverId}) async {
    ChatModel? retrieved;
    final currentUser = await SharedService.getUserProfile();
    if (currentUser != null) {
      try {
        Map<String, dynamic> data = {
          "senderId": currentUser.user!.id,
          "receiverId": recieverId
        };
        // ignore: unused_local_variable
        final body = (data);
        // final res = chatModelToJson(body);
        var response = await DioClient().post(ApiEndPoints.chat, '', data);
        final res = jsonEncode(response);
        retrieved = chatModelFromJson(res);
        return retrieved;
      } catch (e) {
        rethrow;
      }
    }
    return retrieved!;
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

  Future<ChatModel> findChat(
      {required String userId,
      required String clientId,
      required BuildContext context}) async {
    ChatModel list;

    try {
      var response = await DioClient().get(
        ApiEndPoints.chat,
        "find/$userId/$clientId",
      );
      if (response == null) {
        log("Yeah here create new chat");
        list = await createChat(recieverId: clientId);
      } else {
        final res = jsonEncode(response);
        list = chatModelFromJson(res);
        context
            .read<ChatCubit>()
            .getMessages(chatId: list.id!, clientId: clientId);
      }
      // list = data;
      return list;
    } catch (e) {
      rethrow;
    }
  }

  Future addMessage({required MessageModel message}) async {
    try {
      final body = message.toJson();
      var res = await DioClient().post("${ApiEndPoints.message}/", '', body);
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
