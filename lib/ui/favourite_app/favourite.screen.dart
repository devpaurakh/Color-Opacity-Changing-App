import 'package:coloropacityapp/bloc/favourite_bloc/favourite_app_bloc.dart';
import 'package:coloropacityapp/bloc/favourite_bloc/favourite_app_event.dart';
import 'package:coloropacityapp/bloc/favourite_bloc/favourite_app_state.dart';
import 'package:coloropacityapp/model/favourite_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteApp extends StatefulWidget {
  const FavouriteApp({super.key});

  @override
  State<FavouriteApp> createState() => _FavouriteAppState();
}

class _FavouriteAppState extends State<FavouriteApp> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteAppBloc>().add(FetchFavouriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite App"),
        actions: [
          
          BlocBuilder<FavouriteAppBloc, FavouriteAppState>(builder: (context, state){
            return Visibility(
              visible: state.tempFavouriteItems.isNotEmpty ? true : false,
              child: IconButton(
                onPressed: () {
                   context.read<FavouriteAppBloc>().add(DeleteItem());
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
            );

           

          })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<FavouriteAppBloc, FavouriteAppState>(
            builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.loading:
              return const Center(child: CircularProgressIndicator());

            case ListStatus.failure:
              return const Center(
                child: Text("Some Thing Went Wrong"),
              );

            case ListStatus.success:
              return ListView.builder(
                  itemCount: state.favouriteItems.length,
                  itemBuilder: (context, index) {
                    final item = state.favouriteItems[index];
                    return Card(
                      child: ListTile(
                        leading: Checkbox(
                            value: state.tempFavouriteItems.contains(item)
                                ? true
                                : false,
                            onChanged: (value) {
                              if (value == true) {
                                context
                                    .read<FavouriteAppBloc>()
                                    .add(SelectItemListItem(item: item));
                              } else {
                                context
                                    .read<FavouriteAppBloc>()
                                    .add(UnSelectItemListItem(item: item));
                              }
                            }),
                        title: Text(item.value.toString()),
                        trailing: IconButton(
                            onPressed: () {
                              FavouriteItemsModel itemsModel =
                                  FavouriteItemsModel(
                                      id: item.id,
                                      value: item.value,
                                      isFavourite:
                                          item.isFavourite ? false : true);
                              context.read<FavouriteAppBloc>().add(
                                  FetchFavouriteListItem(item: itemsModel));
                            },
                            icon: Icon(item.isFavourite
                                ? Icons.favorite
                                : Icons.favorite_outline)),
                        tileColor: item.isFavourite ? Colors.purple : null,
                      ),
                    );
                  });
          }
        }),
      ),
    );
  }
}
