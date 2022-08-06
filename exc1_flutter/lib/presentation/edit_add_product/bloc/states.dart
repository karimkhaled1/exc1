import 'package:exc1_flutter/domain/entities/product.dart';

abstract class EditState {}

class InitalState extends EditState {
  late Product product;

  InitalState(this.product);
}

class LoadingState extends EditState {}

class DoneState extends EditState {}

class ErrorState extends EditState {
  String message;
  ErrorState(this.message);
}
