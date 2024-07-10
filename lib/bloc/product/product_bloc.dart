import 'package:coloropacityapp/bloc/product/product_event.dart';
import 'package:coloropacityapp/bloc/product/product_state.dart';
import 'package:coloropacityapp/repository/product_repositiry.dart';
import 'package:coloropacityapp/utiles/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState>{

  ProductRepositiry productRepositiry = ProductRepositiry();
  
  ProductBloc(): super(const ProductState()){
    on<FectchProducts>(fetchProductApi);
  }


  void fetchProductApi(FectchProducts event, Emitter<ProductState> emit) async{

    await productRepositiry.fectchProducts().then((value){

      emit(state.copyWith(status: Status.success,message: "We Got the Data",productList: value));

    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      emit(state.copyWith(status: Status.failure,message: error.toString()));
    },);
}


  
}

