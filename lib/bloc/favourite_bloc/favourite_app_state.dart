import 'package:coloropacityapp/model/favourite_items.dart';
import 'package:equatable/equatable.dart';

enum ListStatus { loading, success, failure }

class FavouriteAppState extends Equatable {
  final List<FavouriteItemsModel> favouriteItems;
  final List<FavouriteItemsModel> tempFavouriteItems;
  final ListStatus listStatus;

  const FavouriteAppState(
      {
        this.favouriteItems = const [],
        this.tempFavouriteItems = const [],
       this.listStatus = ListStatus.loading});

  FavouriteAppState copyWith(
      {List<FavouriteItemsModel>? favouriteItems, List<FavouriteItemsModel>? tempFavouriteItems,  ListStatus? listStatus}) {
    return FavouriteAppState(
      favouriteItems: favouriteItems ?? this.favouriteItems,
      tempFavouriteItems: tempFavouriteItems ?? this.tempFavouriteItems,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  @override
  List<Object?> get props => [favouriteItems, tempFavouriteItems, listStatus,];
}
