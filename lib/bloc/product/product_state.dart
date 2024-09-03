import 'package:coloropacityapp/model/products.models.dart';
import 'package:coloropacityapp/utiles/enums.dart';
import 'package:equatable/equatable.dart';

class ProductState extends Equatable {
  final Status status;
  final List<ProductsModel> productList;
  final List<ProductsModel> tempProductList;
  final String message;
  final String searchMessage;

  const ProductState({
    this.status = Status.loading,
    this.productList = const <ProductsModel>[],
    this.tempProductList = const <ProductsModel>[],
    this.message = '',
    this.searchMessage = ''
  });

  ProductState copyWith(
      {Status? status,
      List<ProductsModel>? productList,
      String? message,
      String? searchMessage,
      List<ProductsModel>? tempProductList}) {
    return ProductState(
      status: status ?? this.status,
      productList: productList ?? this.productList,
      tempProductList: tempProductList ?? this.tempProductList,
      message: message ?? this.message,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  @override
  List<Object?> get props => [status, productList, tempProductList, message, searchMessage];
}
