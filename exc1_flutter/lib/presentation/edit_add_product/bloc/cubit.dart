import 'package:exc1_flutter/data/models/product_mode.dart';
import 'package:exc1_flutter/domain/entities/product.dart';
import 'package:exc1_flutter/domain/use_cases/product_usecase.dart';
import 'package:exc1_flutter/presentation/edit_add_product/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class EditProductCubit extends Cubit<EditState> {
  EditProductCubit(Product product)
      : todoUsecase = GetIt.I.get(),
        super(InitalState(product));
  final ProductUseCase todoUsecase;

  addProduct(ProductModel product) async {
    emit(LoadingState());
    try {
      var products = await todoUsecase.addProduct(product);
      emit(DoneState());
    } catch (e) {
      emit(ErrorState("something went wrong"));
    }
  }

  editProduct(ProductModel product) async {
    emit(LoadingState());
    try {
      await todoUsecase.updateProduct(product);
      emit(DoneState());
    } catch (e) {
      emit(ErrorState("something went wrong"));
    }
  }
}
