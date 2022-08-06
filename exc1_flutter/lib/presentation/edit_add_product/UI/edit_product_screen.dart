import 'dart:math';

import 'package:exc1_flutter/data/models/product_mode.dart';
import 'package:exc1_flutter/domain/entities/product.dart';
import 'package:exc1_flutter/presentation/edit_add_product/bloc/cubit.dart';
import 'package:exc1_flutter/presentation/edit_add_product/bloc/states.dart';
import 'package:exc1_flutter/presentation/home/bloc/home_cubit.dart';
import 'package:exc1_flutter/presentation/home/bloc/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProductScreen extends StatefulWidget {
  final Product? product;
  const EditProductScreen({Key? key, this.product}) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  late TextEditingController nameController;
  late TextEditingController priceController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    nameController = TextEditingController(text: widget.product?.name ?? "");
    priceController = TextEditingController(text: widget.product?.price.toString() ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditProductCubit>(
        create: (_) => EditProductCubit(widget.product ?? Product(name: "", price: 0)),
        child: Scaffold(
          appBar: AppBar(title: const Text("edit")),
          // floatingActionButton: Builder(builder: (context) {
          //   return FloatingActionButton(
          //       onPressed: () {
          //         context.read<EditAddProductCubit>().addProduct(ProductModel(name: "name", price: Random().nextInt(50)));
          //       },
          //       child: const Icon(Icons.add));
          // }),
          body: Builder(builder: (context) {
            return BlocConsumer<EditProductCubit, EditState>(listener: (context, state) {
              if (state is DoneState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("edited")));
                Navigator.pop(context);
              }
            }, builder: (context, state) {
              // if (state is LoadingState) {
              //   return const Center(
              //     child: CircularProgressIndicator(),
              //   );
              // } else if (state is ErrorState) {
              //   return Center(
              //     child: Text(state.message),
              //   );
              // } else if (state is DataLoadedState) {
              //   return ListView.builder(itemCount: state.products.length, itemBuilder: (context, index) => ItemWidget(state.products[index]));
              // }

              return Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      controller: nameController,
                      validator: (s) => validateName(s) ? null : "wrong name",
                      decoration: InputDecoration(
                        label: Text("name"),
                      ),
                    ),
                    TextFormField(
                      controller: priceController,
                      validator: (s) => validateprice(num.tryParse(s ?? "0")) ? null : "wrong price",
                      decoration: InputDecoration(label: Text("price")),
                    ),
                    TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context
                                .read<EditProductCubit>()
                                .editProduct(ProductModel(name: nameController.text, price: int.parse(priceController.text), id: widget.product!.id));
                          }
                        },
                        child: Text("submit"))
                  ],
                ),
              );
            });
          }),
        ));
  }
}
