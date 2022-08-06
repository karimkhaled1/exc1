import 'package:exc1_flutter/domain/repo/repo.dart';

import '../../data/models/product_mode.dart';
import '../entities/product.dart';

class ProductUseCase {
  ProductRepo repo;
  ProductUseCase(this.repo);
  Future<List<Product>> getProducts() => repo.getProducts();

  Future<Product> addProduct(ProductModel product) => repo.addProduct(product);

  Future<Product> updateProduct(ProductModel product) => repo.updateProduct(product);

  Future<void> deleteProduct(ProductModel product) => repo.deleteProduct(product);
}
