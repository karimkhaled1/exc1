import 'package:exc1_flutter/data/datasourcce/connection/connectivity.dart';
import 'package:exc1_flutter/data/datasourcce/local/db_datasource.dart';
import 'package:exc1_flutter/data/datasourcce/remote/api_datasource.dart';
import 'package:exc1_flutter/data/models/product_mode.dart';
import 'package:exc1_flutter/data/repo/repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'repo_imp_test.mocks.dart';


@GenerateMocks([DbRepo, ConnectivityService, ApiRepo])
void main() {
  late PeopleRepoImp repoImp;
  late MockApiRepo api;
  late MockDbRepo db;
  late MockConnectivityService connection;
  late ProductModel product;
  setUp(() {
    product = ProductModel(id:1,name: "name",price: 10);

    api = MockApiRepo();

    db = MockDbRepo();
    connection = MockConnectivityService();
    repoImp = PeopleRepoImp(apiRepo: api, connectionChecker: connection, dbrepo: db);
  });
  test("repo test get products online ", () {
    when(connection.isConnected()).thenReturn(true);
    when(api.getProducts()).thenAnswer((_) => Future.value([]));
    when(db.getProducts()).thenAnswer((_) => Future.value([]));

    repoImp.getProducts();
    verify(api.getProducts()).called(1);
    verifyNever(db.getProducts());
  });
  test("repo test get products offline", () {
    when(connection.isConnected()).thenReturn(false);
    when(api.getProducts()).thenAnswer((_) => Future.value([]));
    when(db.getProducts()).thenAnswer((_) => Future.value([]));

    repoImp.getProducts();
    verify(db.getProducts()).called(1);
    verifyNever(api.getProducts());
  });

  test("repo test delete products", () {


    repoImp.deleteProduct(product);
    verify(db.deleteProduct(product)).called(1);
    verify(api.deleteProduct(product)).called(1);
  });
}
