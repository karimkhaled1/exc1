import 'package:exc1_flutter/data/datasourcce/local/db_datasource.dart';
import 'package:exc1_flutter/data/models/product_mode.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late DbRepo dbRepo;
  late ProductModel product;

  setUpAll(() {
    dbRepo = DbRepo();
    product = ProductModel(id: 1, name: "name", price: 10);
    dbRepo.clear();
  });
  test("db test add", () async {
    await dbRepo.addProduct(product);
    expect((await dbRepo.getProducts()).firstWhere((element) => element.id == 1).id, equals(product.id));
  });
  test("db test update", () async {
    await dbRepo.addProduct(product);
    await dbRepo.updateProduct(product..name = "updated");
    expect((await dbRepo.getProducts()).firstWhere((element) => element.id == 1).name, equals("updated"));
  });
  test("db test delete", () async {
    await dbRepo.addProduct(product);
    await dbRepo.deleteProduct(product);
    expect((await dbRepo.getProducts()).length, equals(0));
  });
}
