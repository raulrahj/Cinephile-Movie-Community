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

// enum ChatId { THE_62_C1_B80_B660280_C1_A954_D5_DC }

// final chatIdValues = EnumValues({
//     "62c1b80b660280c1a954d5dc": ChatId.THE_62_C1_B80_B660280_C1_A954_D5_DC
// });

// enum Name { ADARSH, ARYA }

// final nameValues = EnumValues({
//     "adarsh": Name.ADARSH,
//     "Arya": Name.ARYA
// });

// enum SenderId { THE_62_BE900600_B1_AEF58_E50695_D, THE_62_C1_B326596_C16_B570248469 }

// final senderIdValues = EnumValues({
//     "62be900600b1aef58e50695d": SenderId.THE_62_BE900600_B1_AEF58_E50695_D,
//     "62c1b326596c16b570248469": SenderId.THE_62_C1_B326596_C16_B570248469
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }
