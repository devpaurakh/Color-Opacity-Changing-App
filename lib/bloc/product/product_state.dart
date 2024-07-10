import 'package:coloropacityapp/model/products.models.dart';
import 'package:coloropacityapp/utiles/enums.dart';
import 'package:equatable/equatable.dart';

class ProductState extends Equatable {
  final Status status;
  final List<ProductsModel> productList;
  final String message;

  const ProductState({
    this.status = Status.loading,
    this.productList = const <ProductsModel>[],
    this.message = '',
  });

  ProductState copyWith(
      {Status? status, List<ProductsModel>? productList, String? message}) {
    return ProductState(
      status: status ?? this.status,
      productList: productList ?? this.productList,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, productList, message];
}
