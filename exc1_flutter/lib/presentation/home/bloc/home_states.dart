import 'package:exc1_flutter/domain/entities/product.dart';

abstract class HomeSate {}

class InitalState extends HomeSate {}
class LoadingState extends HomeSate {}

class DataLoadedState extends HomeSate {
  List<Product> products;
  DataLoadedState(this.products);
}

class ErrorState extends HomeSate {
  String message;
  ErrorState(this.message);
}
