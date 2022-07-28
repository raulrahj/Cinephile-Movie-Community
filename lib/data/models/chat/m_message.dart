// To parse this JSON data, do
//
//     final massageModel = massageModelFromJson(jsonString);

import 'dart:convert';

List<MessageModel> messageModelFromJson(String str) => List<MessageModel>.from(
    json.decode(str).map((x) => MessageModel.fromJson(x)));

String messageModelToJson(List<MessageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MessageModel {
  MessageModel({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.text,
    required this.name,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String chatId;
  String senderId;
  String text;
  String name;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        id: json["_id"],
        chatId: json["chatId"],
        senderId: json["senderId"],
        text: json["text"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "chatId": chatId,
        "senderId": senderId,
        "text": text,
        "name": name,
        "createdAt": createdAt != null
            ? createdAt!.toIso8601String()
            : DateTime.now().toString(),
        "updatedAt": updatedAt != null
            ? updatedAt!.toIso8601String()
            : DateTime.now().toString(),
        "__v": v,
      };
}
