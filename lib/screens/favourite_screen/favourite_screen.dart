import 'package:app1/provider/app_provider.dart';
import 'package:app1/screens/favourite_screen/widgets/single_favourite_item.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        //toolbarHeight: 100.0,
        //backgroundColor: Colors.white,
        title: const Text("Favourite Screen ",
            style: TextStyle(
              color: Colors.black,
            )),
      ),
      body: appProvider.getFavouriteProductList.isEmpty
          ? const Center(
              child: Text("Empty Cart"),
            )
          : ListView.builder(
              itemCount: appProvider.getFavouriteProductList.length,
              padding: const EdgeInsets.all(12),
              itemBuilder: (ctx, index) {
                return SingleFavouriteItem(
                  singleProduct: appProvider.getFavouriteProductList[index],
                );
              },
            ),
    );
  }
}
