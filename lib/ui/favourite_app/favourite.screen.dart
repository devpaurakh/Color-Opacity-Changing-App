import 'package:coloropacityapp/bloc/favourite_bloc/favourite_app_bloc.dart';
import 'package:coloropacityapp/bloc/favourite_bloc/favourite_app_event.dart';
import 'package:coloropacityapp/bloc/favourite_bloc/favourite_app_state.dart';
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
    // TODO: implement initState
    super.initState();

    context.read<FavouriteAppBloc>().add(FetchFavouriteList());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite App"),
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
                        title: Text(item.value.toString()),
                      ),
                    );
                  });
          }
        }),
      ),
    );
  }
}
