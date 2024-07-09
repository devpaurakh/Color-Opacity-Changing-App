import 'package:coloropacityapp/bloc/favourite_bloc/favourite_app_event.dart';
import 'package:coloropacityapp/bloc/favourite_bloc/favourite_app_state.dart';
import 'package:coloropacityapp/model/favourite_items.dart';
import 'package:coloropacityapp/repository/favourite_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteAppBloc extends Bloc<FavouriteAppEvent, FavouriteAppState> {
  FavouriteRepository favouriteRepository;
  List<FavouriteItemsModel> favouriteList = [];

  FavouriteAppBloc(this.favouriteRepository)
      : super(const FavouriteAppState()) {
    on<FetchFavouriteList>(fetchList);
    on<FetchFavouriteListItem>(_addFavouritItem);
  }

  void fetchList(
      FetchFavouriteList event, Emitter<FavouriteAppState> emit) async {
    favouriteList = await favouriteRepository.fetchItem();
    emit(state.copyWith(
        favouriteItems: List.from(favouriteList),
        listStatus: ListStatus.success));
  }

  void _addFavouritItem(
      FetchFavouriteListItem event, Emitter<FavouriteAppState> emit) async {
    final index =
        favouriteList.indexWhere((element) => element.id == event.item.id);
    favouriteList[index] = event.item;

    emit(state.copyWith(favouriteItems: List.from(favouriteList)));
  }
}
