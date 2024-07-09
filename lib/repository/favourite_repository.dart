import 'package:coloropacityapp/model/favourite_items.dart';

class FavouriteRepository {
  Future<List<FavouriteItemsModel>> fetchItem() async {
    await Future.delayed(const Duration(seconds: 3));
    return List.of(_generateList(10));
  }

  List<FavouriteItemsModel> _generateList(int length) {
    return List.generate(
        length,
        (index) =>
            FavouriteItemsModel(id: index.toString(), value: 'item $index'));
  }
}
