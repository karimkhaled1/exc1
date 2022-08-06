import 'package:dio/dio.dart';
import 'package:exc1_flutter/data/models/product_mode.dart';
import 'package:exc1_flutter/domain/repo/repo.dart';

abstract class ApiBaseDataSource {
  Future<ProductModel> addProduct(ProductModel product);
  Future<void> deleteProduct(ProductModel product);
  Future<List<ProductModel>> getProducts();
  Future<ProductModel> updateProduct(ProductModel product);
}

class ApiRepo extends ApiBaseDataSource {
  static const String _url = 'http://10.0.2.2:8080';
  // static const String _url = 'localhost:8080';
  Dio dio = Dio(BaseOptions(baseUrl: _url));

  @override
  Future<ProductModel> addProduct(ProductModel product) async {
    var res = await dio.post("", data: product.toJson());
    return ProductModel.fromJson(res.data['data']);
  }

  @override
  Future<void> deleteProduct(ProductModel product) async {
    await dio.delete("", data: product.toJson());
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    var res = await dio.get("");
    return res.data['data'].map<ProductModel>((e) => ProductModel.fromJson(e)).toList();
  }

  @override
  Future<ProductModel> updateProduct(ProductModel product) async {
    var res = await dio.put("", data: product.toJson());
    return ProductModel.fromJson(res.data['data']);
  }
}
