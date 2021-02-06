// To parse this JSON data, do
//
//     final signInResponse = signInResponseFromJson(jsonString);

import 'dart:convert';

SignInResponse signInResponseFromJson(String str) =>
    SignInResponse.fromJson(json.decode(str));

String signInResponseToJson(SignInResponse data) => json.encode(data.toJson());

class SignInResponse {
  SignInResponse({
    this.meta,
    this.tokens,
    this.userId,
    this.firstName,
    this.lastName,
    this.imageUrl,
    this.userRoles,
    this.entityType,
    this.entityId,
    this.entityName,
  });

  Meta meta;
  Tokens tokens;
  String userId;
  String firstName;
  String lastName;
  String imageUrl;
  List<UserRole> userRoles;
  String entityType;
  String entityId;
  String entityName;

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
        meta: Meta.fromJson(json["meta"]),
        tokens: Tokens.fromJson(json["tokens"]),
        userId: json["user_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        imageUrl: json["image_url"],
        userRoles: List<UserRole>.from(
            json["user_roles"].map((x) => UserRole.fromJson(x))),
        entityType: json["entity_type"],
        entityId: json["entity_id"],
        entityName: json["entity_name"],
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "tokens": tokens.toJson(),
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "image_url": imageUrl,
        "user_roles": List<dynamic>.from(userRoles.map((x) => x.toJson())),
        "entity_type": entityType,
        "entity_id": entityId,
        "entity_name": entityName,
      };
}

class Meta {
  Meta({
    this.message,
    this.code,
  });

  String message;
  int code;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
      };
}

class Tokens {
  Tokens({
    this.refresh,
    this.refreshExp,
    this.access,
    this.accessExp,
  });

  String refresh;
  DateTime refreshExp;
  String access;
  DateTime accessExp;

  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
        refresh: json["refresh"],
        refreshExp: DateTime.parse(json["refresh_exp"]),
        access: json["access"],
        accessExp: DateTime.parse(json["access_exp"]),
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "refresh_exp": refreshExp.toIso8601String(),
        "access": access,
        "access_exp": accessExp.toIso8601String(),
      };
}

class UserRole {
  UserRole({
    this.role,
    this.roleName,
    this.roleDescription,
  });

  int role;
  String roleName;
  String roleDescription;

  factory UserRole.fromJson(Map<String, dynamic> json) => UserRole(
        role: json["role"],
        roleName: json["role_name"],
        roleDescription: json["role_description"],
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "role_name": roleName,
        "role_description": roleDescription,
      };
}
