import 'package:exc1_flutter/data/models/product_mode.dart';
import 'package:exc1_flutter/domain/entities/product.dart';
import 'package:exc1_flutter/domain/use_cases/product_usecase.dart';
import 'package:exc1_flutter/presentation/home/bloc/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HomeSubit extends Cubit<HomeSate> {
  HomeSubit()
      : todoUsecase = GetIt.I.get(),
        super(InitalState()) {
    getData();
  }
  final ProductUseCase todoUsecase;

  getData() async {
    emit(LoadingState());
    try {
      var products = await todoUsecase.getProducts();
      emit(DataLoadedState(products));
    } catch (e) {
      emit(ErrorState("something went wrong"));
    }
  }

  addProduct(Product product) async {
    await todoUsecase.addProduct(ProductModel.fromProduct(product));
    await getData();
  }

  void delete(Product product) async {
    await todoUsecase.deleteProduct(ProductModel.fromProduct(product));
    await getData();
  }
}
