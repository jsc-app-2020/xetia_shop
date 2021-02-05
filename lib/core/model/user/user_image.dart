// To parse this JSON data, do
//
//     final userImage = userImageFromJson(jsonString);

import 'dart:convert';

UserImage userImageFromJson(String str) => UserImage.fromJson(json.decode(str));

String userImageToJson(UserImage data) => json.encode(data.toJson());

class UserImage {
  UserImage({
    this.meta,
    this.data,
  });

  Meta meta;
  Data data;

  factory UserImage.fromJson(Map<String, dynamic> json) => UserImage(
        meta: Meta.fromJson(json["meta"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  String id;
  String imageUrl;
  DateTime createdAt;
  DateTime updatedAt;
  String user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        imageUrl: json["image_url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image_url": imageUrl,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user,
      };
}

class Meta {
  Meta({
    this.code,
    this.message,
  });

  int code;
  String message;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
