// To parse this JSON data, do
//
//     final register = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    this.meta,
  });

  Meta meta;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
      };
}

class Meta {
  Meta({
    this.code,
    this.message,
  });

  int code;
  dynamic message;

  factory Meta.fromJson(Map<dynamic, dynamic> json) => Meta(
        code: json["code"],
        message: json["message"],
      );

  Map<dynamic, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
