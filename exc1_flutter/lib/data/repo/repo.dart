import 'package:exc1_flutter/data/datasourcce/connection/connectivity.dart';
import 'package:exc1_flutter/data/datasourcce/local/db_datasource.dart';
import 'package:exc1_flutter/data/datasourcce/remote/api_datasource.dart';
import 'package:exc1_flutter/data/models/product_mode.dart';

import '../../domain/entities/product.dart';
import '../../domain/repo/repo.dart';

class PeopleRepoImp extends ProductRepo {
  final LocalBaseDataSource dbrepo;
  final ApiBaseDataSource apiRepo;
  final ConnectionCheck connectionChecker;
  PeopleRepoImp({required this.dbrepo, required this.apiRepo, required this.connectionChecker});

  @override
  Future<Product> addProduct(ProductModel product) async {
    dbrepo.addProduct(product);
    return await apiRepo.addProduct(product);
  }

  @override
  Future<void> deleteProduct(ProductModel product) async {
    dbrepo.deleteProduct(product);
    return await apiRepo.deleteProduct(product);
  }

  @override
  Future<List<Product>> getProducts() {
    if (connectionChecker.isConnected()) {
      return apiRepo.getProducts();
    }
    return dbrepo.getProducts();
  }

  @override
  Future<Product> updateProduct(ProductModel product) async {
    dbrepo.updateProduct(product);
    return await apiRepo.updateProduct(product);
  }
}
