import 'package:app1/provider/app_provider.dart';
import 'package:app1/screens/cart_screen/widgets/single_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
       // toolbarHeight: 100.0,
        //backgroundColor: Colors.white,
        title: const Text("Cart Screen ",
            style: TextStyle(
              color: Colors.black,
            )),
      ),
      body: appProvider.getCartProductList.isEmpty
          ? const Center(
              child: Text("Empty Cart"),
            )
          : ListView.builder(
              itemCount: appProvider.getCartProductList.length,
              padding: const EdgeInsets.all(12),
              itemBuilder: (ctx, index) {
                return SingleCartItem(
                  singleProduct: appProvider.getCartProductList[index],
                );
              },
            ),
    );
  }
}
