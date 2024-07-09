import 'package:coloropacityapp/bloc/favourite_bloc/favourite_app_event.dart';
import 'package:coloropacityapp/bloc/favourite_bloc/favourite_app_state.dart';
import 'package:coloropacityapp/model/favourite_items.dart';
import 'package:coloropacityapp/repository/favourite_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteAppBloc extends Bloc<FavouriteAppEvent, FavouriteAppState> {
  FavouriteRepository favouriteRepository;
  List<FavouriteItemsModel> favouriteList = [];

  List<FavouriteItemsModel> tempFavouriteList = [];

  FavouriteAppBloc(this.favouriteRepository)
      : super(const FavouriteAppState()) {
    on<FetchFavouriteList>(fetchList);
    on<FetchFavouriteListItem>(_addFavouritItem);
    on<SelectItemListItem>(_addSelectFavouritItem);
    on<UnSelectItemListItem>(_addUnSelectFavouritItem);
    on<DeleteItem>(_deleteItem);
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

    if (event.item.isFavourite) {
      if (tempFavouriteList.contains(favouriteList[index])) {
        tempFavouriteList.remove(favouriteList[index]);
        tempFavouriteList.add(event.item);
      }
    } else {
      if (tempFavouriteList.contains(favouriteList[index])) {
        tempFavouriteList.remove(favouriteList[index]);
        tempFavouriteList.add(event.item);
      }
    }
    favouriteList[index] = event.item;

    emit(state.copyWith(favouriteItems: List.from(favouriteList), tempFavouriteItems: List.of(tempFavouriteList)));
  }

  void _addSelectFavouritItem(
      SelectItemListItem event, Emitter<FavouriteAppState> emit) async {
    tempFavouriteList.add(event.item);
    emit(state.copyWith(tempFavouriteItems: List.from(tempFavouriteList)));
  }

  void _addUnSelectFavouritItem(
      UnSelectItemListItem event, Emitter<FavouriteAppState> emit) async {
    tempFavouriteList.remove(event.item);

    emit(state.copyWith(tempFavouriteItems: List.from(tempFavouriteList)));
  }

  void _deleteItem(DeleteItem event, Emitter<FavouriteAppState> emit) async {
    for (var i = 0; i < tempFavouriteList.length; i++) {
      favouriteList.remove(tempFavouriteList[i]);
    }
    tempFavouriteList.clear;
    emit(state.copyWith(
        favouriteItems: List.from(favouriteList),
        tempFavouriteItems: List.from(tempFavouriteList)));
  }
}
