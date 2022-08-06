import 'package:exc1_flutter/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({int? id, required String name, required num price}) : super(id: id, name: name, price: price);
  ProductModel.fromJson(Map<String, dynamic> json) : super(id: json['id'], name: json['name'] ?? "", price: json['price'] ?? 0);

  Map<String, dynamic> toJson() {
    return {'name': name, 'price': price, "id": id};
  }

  ProductModel.fromProduct(Product product) : super(id: product.id, name: product.name, price: product.price);
}
