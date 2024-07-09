import 'package:coloropacityapp/model/favourite_items.dart';
import 'package:equatable/equatable.dart';

abstract class FavouriteAppEvent extends Equatable{

  const FavouriteAppEvent();

  @override
  List<Object> get props => [];

}

class FetchFavouriteList extends FavouriteAppEvent{
  
}

class FetchFavouriteListItem extends FavouriteAppEvent{

  final FavouriteItemsModel item;

  const FetchFavouriteListItem({required this.item});
  
}


class SelectItemListItem extends FavouriteAppEvent{

  final FavouriteItemsModel selectItem;

  const SelectItemListItem({required this.selectItem});
  
}


class UnSelectItemListItem extends FavouriteAppEvent{

  final FavouriteItemsModel unSelectItem;

  const UnSelectItemListItem({required this.unSelectItem});
  
}




