// Mocks generated by Mockito 5.3.0 from annotations
// in exc1_flutter/test/data/data/repo_imp/repo_imp_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:connectivity_plus/connectivity_plus.dart' as _i7;
import 'package:dio/dio.dart' as _i3;
import 'package:exc1_flutter/data/datasourcce/connection/connectivity.dart' as _i6;
import 'package:exc1_flutter/data/datasourcce/local/db_datasource.dart' as _i4;
import 'package:exc1_flutter/data/datasourcce/remote/api_datasource.dart' as _i8;
import 'package:exc1_flutter/data/models/product_mode.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeProductModel_0 extends _i1.SmartFake implements _i2.ProductModel {
  _FakeProductModel_0(Object parent, Invocation parentInvocation) : super(parent, parentInvocation);
}

class _FakeDio_1 extends _i1.SmartFake implements _i3.Dio {
  _FakeDio_1(Object parent, Invocation parentInvocation) : super(parent, parentInvocation);
}

/// A class which mocks [DbRepo].
///
/// See the documentation for Mockito's code generation for more information.
class MockDbRepo extends _i1.Mock implements _i4.DbRepo {
  MockDbRepo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.ProductModel> addProduct(_i2.ProductModel? product) => (super.noSuchMethod(Invocation.method(#addProduct, [product]),
          returnValue: _i5.Future<_i2.ProductModel>.value(_FakeProductModel_0(this, Invocation.method(#addProduct, [product]))))
      as _i5.Future<_i2.ProductModel>);
  @override
  _i5.Future<void> deleteProduct(_i2.ProductModel? product) => (super.noSuchMethod(Invocation.method(#deleteProduct, [product]),
      returnValue: _i5.Future<void>.value(), returnValueForMissingStub: _i5.Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<List<_i2.ProductModel>> getProducts() =>
      (super.noSuchMethod(Invocation.method(#getProducts, []), returnValue: _i5.Future<List<_i2.ProductModel>>.value(<_i2.ProductModel>[]))
          as _i5.Future<List<_i2.ProductModel>>);
  @override
  _i5.Future<_i2.ProductModel> updateProduct(_i2.ProductModel? product) => (super.noSuchMethod(Invocation.method(#updateProduct, [product]),
          returnValue: _i5.Future<_i2.ProductModel>.value(_FakeProductModel_0(this, Invocation.method(#updateProduct, [product]))))
      as _i5.Future<_i2.ProductModel>);
  @override
  _i5.Future<void> clear() =>
      (super.noSuchMethod(Invocation.method(#clear, []), returnValue: _i5.Future<void>.value(), returnValueForMissingStub: _i5.Future<void>.value())
          as _i5.Future<void>);
}

/// A class which mocks [ConnectivityService].
///
/// See the documentation for Mockito's code generation for more information.
class MockConnectivityService extends _i1.Mock implements _i6.ConnectivityService {
  MockConnectivityService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.ConnectivityResult get connectionStatus =>
      (super.noSuchMethod(Invocation.getter(#connectionStatus), returnValue: _i7.ConnectivityResult.bluetooth) as _i7.ConnectivityResult);
  @override
  set connectionStatus(_i7.ConnectivityResult? _connectionStatus) =>
      super.noSuchMethod(Invocation.setter(#connectionStatus, _connectionStatus), returnValueForMissingStub: null);
  @override
  _i5.Future<void> init() =>
      (super.noSuchMethod(Invocation.method(#init, []), returnValue: _i5.Future<void>.value(), returnValueForMissingStub: _i5.Future<void>.value())
          as _i5.Future<void>);
  @override
  _i5.Future<void> initConnectivity() => (super.noSuchMethod(Invocation.method(#initConnectivity, []),
      returnValue: _i5.Future<void>.value(), returnValueForMissingStub: _i5.Future<void>.value()) as _i5.Future<void>);
  @override
  bool isConnected() => (super.noSuchMethod(Invocation.method(#isConnected, []), returnValue: false) as bool);
}

/// A class which mocks [ApiRepo].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiRepo extends _i1.Mock implements _i8.ApiRepo {
  MockApiRepo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Dio get dio => (super.noSuchMethod(Invocation.getter(#dio), returnValue: _FakeDio_1(this, Invocation.getter(#dio))) as _i3.Dio);
  @override
  set dio(_i3.Dio? _dio) => super.noSuchMethod(Invocation.setter(#dio, _dio), returnValueForMissingStub: null);
  @override
  _i5.Future<_i2.ProductModel> addProduct(_i2.ProductModel? product) => (super.noSuchMethod(Invocation.method(#addProduct, [product]),
          returnValue: _i5.Future<_i2.ProductModel>.value(_FakeProductModel_0(this, Invocation.method(#addProduct, [product]))))
      as _i5.Future<_i2.ProductModel>);
  @override
  _i5.Future<void> deleteProduct(_i2.ProductModel? product) => (super.noSuchMethod(Invocation.method(#deleteProduct, [product]),
      returnValue: _i5.Future<void>.value(), returnValueForMissingStub: _i5.Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<List<_i2.ProductModel>> getProducts() =>
      (super.noSuchMethod(Invocation.method(#getProducts, []), returnValue: _i5.Future<List<_i2.ProductModel>>.value(<_i2.ProductModel>[]))
          as _i5.Future<List<_i2.ProductModel>>);
  @override
  _i5.Future<_i2.ProductModel> updateProduct(_i2.ProductModel? product) => (super.noSuchMethod(Invocation.method(#updateProduct, [product]),
          returnValue: _i5.Future<_i2.ProductModel>.value(_FakeProductModel_0(this, Invocation.method(#updateProduct, [product]))))
      as _i5.Future<_i2.ProductModel>);
}
