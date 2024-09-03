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
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: " Search with Product name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                    onChanged: (inputFilterValue) {
                      context.read<ProductBloc>().add(
                            SearchProduct(inputFilterValue),
                          );
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: state.searchMessage.isNotEmpty
                      ? Text(state.searchMessage.toString())
                      : ListView.builder(
                          itemCount: state.tempProductList.isEmpty
                              ? state.productList.length
                              : state.tempProductList.length,
                          itemBuilder: (context, index) {
                            if (state.tempProductList.isNotEmpty) {
                              final item = state.tempProductList[index];
                              return Column(
                                children: [
                                  const Divider(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, top: 10, right: 0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          item.image.toString(),
                                          height: 120,
                                          width: 120,
                                        ),
                                        const SizedBox(
                                          width: 25,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 200,
                                              child: Text(
                                                item.title.toString(),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 100,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Text(
                                                " Rs. ${item.price.toString()}"),
                                            Text(item.category.toString())
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              final item = state.productList[index];
                              return Column(
                                children: [
                                  const Divider(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, top: 10, right: 0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          item.image.toString(),
                                          height: 120,
                                          width: 120,
                                        ),
                                        const SizedBox(
                                          width: 25,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 200,
                                              child: Text(
                                                item.title.toString(),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 100,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Text(
                                                " Rs. ${item.price.toString()}"),
                                            Text(item.category.toString())
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }
                          }),
                ),
              ],
            );
        }
      }),
    );
  }
}
