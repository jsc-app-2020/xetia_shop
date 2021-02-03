import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:xetia_shop/screens/model/product/detail_product.dart';
import 'package:xetia_shop/screens/model/product/list_product.dart';
import 'package:xetia_shop/screens/model/product/product_response.dart';

// GET semua data product
Future<ProductResponse> getProduct(int page,
    {String category, String search}) async {
  http.Response response;
  if (category != null) {
    response = await http.get(
        'https://02jsc2020-eval-prod.apigee.net/product/get-product?page=$page&category=$category',
        headers: {
          'Content-type': 'application/json',
          'accept': 'application/json'
        });
  } else if (search != null) {
    response = await http.get(
        'https://02jsc2020-eval-prod.apigee.net/product/get-product?page=$page&name=$search',
        headers: {
          'Content-type': 'application/json',
          'accept': 'application/json'
        });
  } else {
    response = await http.get(
        'https://02jsc2020-eval-prod.apigee.net/product/get-product?page=$page',
        headers: {
          'Content-type': 'application/json',
          'accept': 'application/json'
        });
  }
  return ProductResponse.fromJson(jsonDecode(response.body));
}

// GET daftar product
Future<ListProduct> getListProduct() async {
  http.Response res = await http
      .get('https://02jsc2020-eval-prod.apigee.net/list-product', headers: {
    'Content-type': 'application/json',
    'accept': 'application/json'
  });

  if (res.statusCode == 200) {
    ListProduct decode = listProductFromJson(res.body);

    return decode;
  } else {
    throw Exception('failed load data');
  }
}

// GET detail product
Future<DetailProduct> getDetailProduct(int page) async {
  http.Response res = await http.get(
      'https://02jsc2020-eval-prod.apigee.net/product/detail-product?page=$page',
      headers: {
        'Content-type': 'application/json',
        'accept': 'application/json'
      });

  if (res.statusCode == 200) {
    DetailProduct decode = detailProductFromJson(res.body);

    return decode;
  } else {
    throw Exception('failed to load data');
  }
}

// POST dara product
Future<ProductResponse> postProduct(String userId, String name, String desc,
    String weight, String price, List<File> image) async {
  List imageUri = [];

  for (var i = 0; i < image.length; i++) {
    imageUri.insert(i, image[i].uri.path);
  }

  http.Response res = await http.post(
      'https://02jsc2020-eval-prod.apigee.net/product/add-category',
      headers: {
        'shop': '0b1111b2-fa4a-4064-8125-afef6223a695',
        'user': userId,
        'Content-type': 'application/json',
        'accept': 'application/json'
      },
      body: jsonEncode({
        "name": name,
        "description": desc,
        "weight": weight,
        "thumbnail": image[0].uri.path,
        "category": "d1002068-406e-11eb-b378-0242ac130002",
        "discount": "0",
        "variants": ["soto", "goreng"],
        "images": imageUri,
        "price": price,
        "brand": "indomie",
        "colors": ["kuning"],
        "tags": "kol"
      }));

  if (res.statusCode == 200) {
    ProductResponse decode = productResponseFromJson(res.body);

    return decode;
  } else {
    throw Exception("Failed Load Data");
  }
}

// PUt untuk product
Future<ProductResponse> putProduct() async {
  http.Response res = await http.put(
      'https://02jsc2020-eval-prod.apigee.net/product/update-product/bd168d74-4070-11eb-b378-0242ac130002',
      headers: {
        'shop': '0b1111b2-fa4a-4064-8125-afef6223a695',
        'user': 'bd168d74-4070-11eb-b378-0242ac130002',
        'Content-type': 'application/json',
        'accept': 'application/json'
      },
      body: json.encode({
        "name": "mie instan kuah",
        "description": "mie instan",
        "weight": "120gram",
        "category": "d1002068-406e-11eb-b378-0242ac130002",
        "discount": "0",
        "variants": ["soto", "goreng"],
        "price": "350",
        "brand": "indomie",
        "colors": ["kuning"],
        "tags": "kol"
      }));

  if (res.statusCode == 200) {
    ProductResponse decode = productResponseFromJson(res.body);

    return decode;
  } else {
    throw Exception("Failed Load Data");
  }
}
