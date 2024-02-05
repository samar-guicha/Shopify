import 'package:app1/firebase_helper/firebase_firestore/firebase_firestore.dart';
import 'package:app1/models/product_model/product_model.dart';
import 'package:app1/models/user_model/user_model.dart';
import 'package:flutter/cupertino.dart';

class AppProvider with ChangeNotifier {
  ///cart work
  final List<ProductModel> _cartProductList = [];
  UserModel? _userModel;
  UserModel get getUserInformation => _userModel!;
  void addCartProduct(ProductModel productModel) {
    _cartProductList.add(productModel);
    notifyListeners();
  }

  void removeCartProduct(ProductModel productModel) {
    _cartProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get getCartProductList => _cartProductList;

  //favourite
  final List<ProductModel> _favouriteProductList = [];
  void addFavouriteProduct(ProductModel productModel) {
    _favouriteProductList.add(productModel);
    notifyListeners();
  }

  void removeFavouriteProduct(ProductModel productModel) {
    _favouriteProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get getFavouriteProductList => _favouriteProductList;
  void getUserInfoFirebase() async {
    _userModel = await FirebaseFirestoreHelper.instance.getUserInformation();
    notifyListeners();
  }
  // user information
}
