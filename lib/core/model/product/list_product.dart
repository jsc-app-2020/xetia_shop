// To parse this JSON data, do
//
//     final listProduct = listProductFromJson(jsonString);

import 'dart:convert';

ListProduct listProductFromJson(String str) =>
    ListProduct.fromJson(json.decode(str));

String listProductToJson(ListProduct data) => json.encode(data.toJson());

class ListProduct {
  ListProduct({
    this.response,
    this.meta,
  });

  List<Response> response;
  Meta meta;

  factory ListProduct.fromJson(Map<String, dynamic> json) => ListProduct(
        response: List<Response>.from(
            json["response"].map((x) => Response.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}

class Meta {
  Meta({
    this.code,
    this.status,
  });

  int code;
  String status;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
      };
}

class Response {
  Response({
    this.uuid,
    this.name,
  });

  String uuid;
  String name;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        uuid: json["uuid"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "name": name,
      };
}
