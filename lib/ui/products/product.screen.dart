import 'package:coloropacityapp/bloc/product/product_bloc.dart';
import 'package:coloropacityapp/bloc/product/product_event.dart';
import 'package:coloropacityapp/bloc/product/product_state.dart';
import 'package:coloropacityapp/utiles/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(FectchProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
        switch (state.status) {
          case Status.loading:
            return const Center(child: CircularProgressIndicator());
          case Status.failure:
            return Center(child: Text(state.message));
          case Status.success:
            return ListView.builder(
                itemCount: state.productList.length,
                itemBuilder: (context, index) {
                  final item = state.productList[index];
                  return Column(
                    children: [
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, top: 10, right: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              item.image.toString(),
                              height: 120,
                              width: 120,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    item.title.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 100,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(" Rs. ${item.price.toString()}"),
                                Text(item.category.toString())
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                });
        }
      }),
    );
  }
}
