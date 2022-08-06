import 'package:exc1_flutter/domain/entities/product.dart';

import '../../data/models/product_mode.dart';

abstract class ProductRepo {
  Future<List<Product>> getProducts();
  Future<Product> addProduct(ProductModel product);
  Future<void> deleteProduct(ProductModel product);
  Future<Product> updateProduct(ProductModel product);
}
