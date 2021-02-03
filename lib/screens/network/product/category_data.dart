import 'package:http/http.dart' as http;
import 'package:xetia_shop/screens/model/product/category_model.dart';
import 'package:xetia_shop/screens/model/product/product_category.dart';

Future<ProductCategory> getProductCategory({int page = 2}) async {
  http.Response res = await http.get(
      'https://02jsc2020-eval-prod.apigee.net/get-product-category?page=$page',
      headers: {
        'Content-type': 'application/json',
        'accept': 'application/json'
      });

  if (res.statusCode == 200) {
    return productCategoryFromJson(res.body);
  } else {
    throw Exception('failed to load data');
  }
}

Future postCategory({String name}) async {
  http.Response res = await http.post(
      'https://02jsc2020-eval-prod.apigee.net/product/add-category',
      body: {"name": "test category"});

  CategoryModel decode = categoryModelFromJson(res.body);
  if (res.statusCode == 200) {
    print(decode.meta.status);
  } else if (res.statusCode == 500) {
    print(decode.meta.code);
  }
}

Future putCategory(String name, String uuid) async {
  http.Response res = await http.put(
      'https://02jsc2020-eval-prod.apigee.net/product/update-category/$uuid',
      body: {"name": name});

  CategoryModel decode = categoryModelFromJson(res.body);
  if (res.statusCode == 200) {
    print(decode.meta.status);
  } else if (res.statusCode == 500) {
    print(decode.meta.code);
  }
}

Future deleteCategory(String uuid) async {
  http.Response res = await http.delete(
      'https://02jsc2020-eval-prod.apigee.net/product/delete-category/$uuid');

  CategoryModel decode = categoryModelFromJson(res.body);
  if (res.statusCode == 200) {
    print(decode.meta.status);
  } else if (res.statusCode == 500) {
    print(decode.meta.code);
  }
}
