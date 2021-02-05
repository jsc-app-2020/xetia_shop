// To parse this JSON data, do
//
//     final authResponse = authResponseFromJson(jsonString);

import 'dart:convert';

AuthResponse authResponseFromJson(String str) =>
    AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  AuthResponse({
    this.meta,
  });

  MetaRes meta;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        meta: MetaRes.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
      };
}

class MetaRes {
  MetaRes({
    this.code,
    this.message,
  });

  int code;
  String message;

  factory MetaRes.fromJson(Map<String, dynamic> json) => MetaRes(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
