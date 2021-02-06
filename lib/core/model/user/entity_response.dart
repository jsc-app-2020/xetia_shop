// To parse this JSON data, do
//
//     final entityResponse = entityResponseFromJson(jsonString);

import 'dart:convert';

EntityResponse entityResponseFromJson(String str) =>
    EntityResponse.fromJson(json.decode(str));

String entityResponseToJson(EntityResponse data) => json.encode(data.toJson());

class EntityResponse {
  EntityResponse({
    this.meta,
    this.data,
  });

  Meta meta;
  List<Datum> data;

  factory EntityResponse.fromJson(Map<String, dynamic> json) => EntityResponse(
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
    this.name,
    this.description,
    this.location,
    this.telephone,
    this.entityType,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String name;
  String description;
  String location;
  String telephone;
  int entityType;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        location: json["location"],
        telephone: json["telephone"],
        entityType: json["entity_type"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "location": location,
        "telephone": telephone,
        "entity_type": entityType,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
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
