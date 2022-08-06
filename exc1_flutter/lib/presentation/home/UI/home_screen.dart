import 'dart:math';

import 'package:exc1_flutter/data/models/product_mode.dart';
import 'package:exc1_flutter/domain/entities/product.dart';
import 'package:exc1_flutter/presentation/edit_add_product/UI/edit_product_screen.dart';
import 'package:exc1_flutter/presentation/home/bloc/home_cubit.dart';
import 'package:exc1_flutter/presentation/home/bloc/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeSubit>(
        create: (_) => HomeSubit(),
        child: Scaffold(
          appBar: AppBar(title: const Text("products")),
          floatingActionButton: Builder(builder: (context) {
            return FloatingActionButton(
                onPressed: () {
                  var rondom = Random().nextInt(50);
                  context.read<HomeSubit>().addProduct(ProductModel(name: "name$rondom", price: rondom));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("added rondom product")));
                },
                child: const Icon(Icons.add));
          }),
          body: Builder(builder: (context) {
            return BlocBuilder<HomeSubit, HomeSate>(builder: (context, state) {
              if (state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ErrorState) {
                return Center(
                  child: Text(state.message),
                );
              } else if (state is DataLoadedState) {
                return ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) => ItemWidget(state.products[index], onDelete: () {
                          context.read<HomeSubit>().delete(state.products[index]);
                        }, onEdit: () {
                          context.read<HomeSubit>().getData();
                        }));
              }

              return const SizedBox();
            });
          }),
        ));
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget(
    this.product, {
    Key? key,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);
  final Product product;
  final Function onEdit;
  final Function onDelete;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text(product.price.toString()),
      leading: IconButton(
          onPressed: () async {
            await Navigator.of(context).push(MaterialPageRoute(builder: (builder) => EditProductScreen(product: product)));
            onEdit();
          },
          icon: Icon(Icons.edit)),
      trailing: IconButton(
          onPressed: () async {
            onDelete();
          },
          icon: Icon(Icons.delete)),
    );
  }
}
