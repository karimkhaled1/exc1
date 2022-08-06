import 'package:exc1_flutter/data/datasourcce/local/db.dart';
import 'package:exc1_flutter/data/models/product_mode.dart';
import 'package:exc1_flutter/domain/repo/repo.dart';

abstract class LocalBaseDataSource {
  Future<ProductModel> addProduct(ProductModel product);
  Future<void> deleteProduct(ProductModel product);
  Future<List<ProductModel>> getProducts();
  Future<ProductModel> updateProduct(ProductModel product);
}

class DbRepo extends LocalBaseDataSource {
  final DB _db = DB();

  @override
  Future<ProductModel> addProduct(ProductModel product) async => await _db.put(product);

  @override
  Future<void> deleteProduct(ProductModel product) async => await _db.delete(product);

  @override
  Future<List<ProductModel>> getProducts() async => await _db.getAll();

  @override
  Future<ProductModel> updateProduct(ProductModel product) async {
    await _db.update(product);
    return product;
  }

  Future<void> clear() async => _db.clear();
}
