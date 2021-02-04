// To parse this JSON data, do
//
//     final productCategory = productCategoryFromJson(jsonString);

import 'dart:convert';

ProductCategory productCategoryFromJson(String str) =>
    ProductCategory.fromJson(json.decode(str));

String productCategoryToJson(ProductCategory data) =>
    json.encode(data.toJson());

class ProductCategory {
  ProductCategory({
    this.response,
    this.meta,
  });

  Response response;
  Meta meta;

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(
        response: Response.fromJson(json["response"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response.toJson(),
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
    this.data,
    this.currentPage,
    this.nextPageUrl,
    this.previousePageUrl,
    this.total,
  });

  List<Datum> data;
  int currentPage;
  String nextPageUrl;
  dynamic previousePageUrl;
  int total;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        currentPage: json["current_page"],
        nextPageUrl: json["next_page_url"],
        previousePageUrl: json["previouse_page_url"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "current_page": currentPage,
        "next_page_url": nextPageUrl,
        "previouse_page_url": previousePageUrl,
        "total": total,
      };
}

class Datum {
  Datum({
    this.uuid,
    this.name,
  });

  String uuid;
  String name;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uuid: json["uuid"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "name": name,
      };
}
