import 'package:equatable/equatable.dart';
 class ProductEvent extends Equatable {  //class should be sealed
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class FectchProducts extends ProductEvent {}

class SearchProduct extends ProductEvent {
  final String searchString;

  const SearchProduct(this.searchString);
}
