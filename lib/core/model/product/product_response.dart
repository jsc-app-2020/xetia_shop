// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductResponse productResponseFromJson(String str) =>
    ProductResponse.fromJson(json.decode(str));

String productResponseToJson(ProductResponse data) =>
    json.encode(data.toJson());

class ProductResponse {
  ProductResponse({
    this.response,
    this.meta,
  });

  Response response;
  Meta meta;

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponse(
        response: (json["response"] != null)
            ? Response.fromJson(json["response"])
            : null,
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

  List<Product> data;
  int currentPage;
  String nextPageUrl;
  dynamic previousePageUrl;
  int total;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
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

class Product {
  Product({
    this.uuid,
    this.name,
    this.slug,
    this.brand,
    this.description,
    this.weight,
    this.discount,
    this.thumbnail,
    this.price,
    this.categoryId,
    this.category,
    this.shopId,
    this.images,
    this.variants,
    this.colors,
    this.userId,
    this.createdAt,
    this.updateAt,
  });

  String uuid;
  String name;
  String slug;
  String brand;
  String description;
  String weight;
  String discount;
  String thumbnail;
  String price;
  String categoryId;
  String category;
  String shopId;
  List<dynamic> images;
  List<dynamic> variants;
  List<dynamic> colors;
  String userId;
  String createdAt;
  String updateAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        uuid: json["uuid"],
        name: json["name"],
        slug: json["slug"],
        brand: json["brand"],
        description: json["description"],
        weight: json["weight"],
        discount: json["discount"],
        thumbnail: json["thumbnail"],
        price: json["price"],
        categoryId: json["category_id"],
        category: json["category"],
        shopId: json["shop_id"],
        images: List<dynamic>.from(json["images"].map((x) => x)),
        variants: List<dynamic>.from(json["variants"].map((x) => x)),
        colors: List<dynamic>.from(json["colors"].map((x) => x)),
        userId: json["user_id"],
        createdAt: json["created_at"],
        updateAt: json["update_at"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "name": name,
        "slug": slug,
        "brand": brand,
        "description": description,
        "weight": weight,
        "discount": discount,
        "thumbnail": thumbnail,
        "price": price,
        "category_id": categoryId,
        "category": category,
        "shop_id": shopId,
        "images": List<dynamic>.from(images.map((x) => x)),
        "variants": List<dynamic>.from(variants.map((x) => x)),
        "colors": List<dynamic>.from(colors.map((x) => x)),
        "user_id": userId,
        "created_at": createdAt,
        "update_at": updateAt,
      };
}
