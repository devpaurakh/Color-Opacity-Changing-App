import 'package:coloropacityapp/bloc/product/product_event.dart';
import 'package:coloropacityapp/bloc/product/product_state.dart';
import 'package:coloropacityapp/repository/product_repositiry.dart';
import 'package:coloropacityapp/utiles/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/products.models.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  List<ProductsModel> tempProductList = [];
  ProductRepositiry productRepositiry = ProductRepositiry();
  ProductBloc() : super(const ProductState()) {
    on<FectchProducts>(fetchProductApi);
    on<SearchProduct>(_filterProduct);
  }

  void fetchProductApi(FectchProducts event, Emitter<ProductState> emit) async {
    await productRepositiry.fectchProducts().then((value) {
      emit(state.copyWith(
          status: Status.success,
          message: "We Got the Data",
          productList: value));
    }).onError(
      (error, stackTrace) {
        emit(state.copyWith(status: Status.failure, message: error.toString()));
      },
    );
  }

  void _filterProduct(SearchProduct event, Emitter<ProductState> emit) async {
    if (event.searchString.isEmpty) {
      emit(state.copyWith(tempProductList: [], searchMessage: ""));
    } else {
      tempProductList = state.productList
          .where((element) => element.title
              .toString()
              .toLowerCase()
              .contains(event.searchString.toString().toLowerCase()))
          .toList();

      if (tempProductList.isEmpty) {
        emit(state.copyWith(
            tempProductList: tempProductList,
            searchMessage: "No Product Found"));
      } else {
        emit(state.copyWith(
            tempProductList: tempProductList, searchMessage: ''));
      }
    }
  }
}
