import 'package:coloropacityapp/model/favourite_items.dart';
import 'package:equatable/equatable.dart';

enum ListStatus { loading, success, failure }

class FavouriteAppState extends Equatable {
  final List<FavouriteItemsModel> favouriteItems;
  final ListStatus listStatus;

  const FavouriteAppState(
      {this.favouriteItems = const [], this.listStatus = ListStatus.loading});

  FavouriteAppState copyWith(
      {List<FavouriteItemsModel>? favouriteItems, ListStatus? listStatus}) {
    return FavouriteAppState(
      favouriteItems: favouriteItems ?? this.favouriteItems,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  @override
  List<Object?> get props => [favouriteItems, listStatus];
}
