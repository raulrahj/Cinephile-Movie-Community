// To parse this JSON data, do
//
//     final chatsModel = chatsModelFromJson(jsonString);

import 'dart:convert';

List<ChatsModel> chatsModelFromJson(String str) =>
    List<ChatsModel>.from(json.decode(str).map((x) => ChatsModel.fromJson(x)));

String chatsModelToJson(List<ChatsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatsModel {
  ChatsModel({
    required this.id,
    required this.members,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  final String id;
  final List<String> members;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory ChatsModel.fromJson(Map<String, dynamic> json) => ChatsModel(
        id: json["_id"],
        members: List<String>.from(json["members"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "members": List<dynamic>.from(members.map((x) => x)),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}

// To parse this JSON data, do
//
//     final chatModel = chatModelFromJson(jsonString);


ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String chatModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
    ChatModel({
       required this.members,
        this.id,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

   final List<String> members;
    String? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        members: List<String>.from(json["members"].map((x) => x)),
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "members": List<dynamic>.from(members.map((x) => x)),
        "_id": id,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}
