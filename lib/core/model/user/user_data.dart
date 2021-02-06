// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    this.meta,
    this.data,
  });

  Meta meta;
  List<Datum> data;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        meta: Meta.fromJson(json["meta"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.lastLogin,
    this.isSuperuser,
    this.isStaff,
    this.datumIsActive,
    this.dateJoined,
    this.firstName,
    this.lastName,
    this.mobilePhone,
    this.address,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.authProvider,
    this.providerId,
    this.isActive,
    this.entity,
    this.groups,
    this.userPermissions,
  });

  String id;
  dynamic lastLogin;
  bool isSuperuser;
  bool isStaff;
  bool datumIsActive;
  DateTime dateJoined;
  String firstName;
  String lastName;
  String mobilePhone;
  String address;
  String email;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic authProvider;
  dynamic providerId;
  bool isActive;
  String entity;
  List<dynamic> groups;
  List<dynamic> userPermissions;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        lastLogin: json["last_login"],
        isSuperuser: json["is_superuser"],
        isStaff: json["is_staff"],
        datumIsActive: json["is_active"],
        dateJoined: DateTime.parse(json["date_joined"]),
        firstName: json["first_name"],
        lastName: json["last_name"],
        mobilePhone: json["mobile_phone"] == null ? null : json["mobile_phone"],
        address: json["address"] == null ? null : json["address"],
        email: json["email"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        authProvider: json["auth_provider"],
        providerId: json["provider_id"],
        isActive: json["isActive"],
        entity: json["entity"] == null ? null : json["entity"],
        groups: List<dynamic>.from(json["groups"].map((x) => x)),
        userPermissions:
            List<dynamic>.from(json["user_permissions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "last_login": lastLogin,
        "is_superuser": isSuperuser,
        "is_staff": isStaff,
        "is_active": datumIsActive,
        "date_joined": dateJoined.toIso8601String(),
        "first_name": firstName,
        "last_name": lastName,
        "mobile_phone": mobilePhone == null ? null : mobilePhone,
        "address": address == null ? null : address,
        "email": email,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "auth_provider": authProvider,
        "provider_id": providerId,
        "isActive": isActive,
        "entity": entity == null ? null : entity,
        "groups": List<dynamic>.from(groups.map((x) => x)),
        "user_permissions": List<dynamic>.from(userPermissions.map((x) => x)),
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
