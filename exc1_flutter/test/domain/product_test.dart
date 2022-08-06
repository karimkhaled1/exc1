import 'package:exc1_flutter/data/models/product_mode.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Map<String, dynamic> json = {"id": 1, "name": "name", "price": 20};

  test("product from json", () {
    var product = ProductModel.fromJson(json);
    expect(product.id, equals(1));
    expect(product.name, equals("name"));
    expect(product.price, equals(20));
  });

  test("product to json", () {
    var product = ProductModel(id:1,name: "name",price: 20);
    var resultJson = product.toJson();
    expect(resultJson['id'], json['id']);
    expect(resultJson['name'], json['name']);
    expect(resultJson['price'], json['price']);
  });
}
