import 'package:exc1_flutter/data/models/product_mode.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class DB {
  static final DB _db = DB._internal();
  BoxCollection? collection;
  CollectionBox? _peopleBox;

  factory DB() {
    return _db;
  }

  DB._internal();
  init() async {
    if (collection != null) return;
    final directory = await getApplicationDocumentsDirectory();

    collection = await BoxCollection.open(
      'MyFirstFluffyBox',
      {'people'},
      path: directory.path,
    );
    _peopleBox = await collection!.openBox('people');
  }

  put(ProductModel product) async {
    await init();
    await _peopleBox!.put(product.id.toString(), product.toJson());
    return product;
  }

  Future<List<ProductModel>> getAll() async {
    await init();
    return (await _peopleBox!.getAllValues()).values.map<ProductModel>((e) => ProductModel.fromJson(e.cast<String, dynamic>())).toList();
  }

  Future<void> delete(ProductModel product) async {
    await init();
    return (await _peopleBox!.delete(product.id.toString()));
  }

  Future<ProductModel> update(ProductModel product) async {
    await init();
    await _peopleBox!.put(product.id.toString(), product.toJson());
    return product;
  }

  Future<void> clear() async {
    await init();
    return (await _peopleBox!.clear());
  }
}
