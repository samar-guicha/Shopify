import 'package:flutter/material.dart';

class Routes {
  static Routes instance = Routes();
  //This method is used to push a new screen (widget) onto the navigation stack and remove all previous routes until a certain condition is met. In this case, the condition is (route) => false, which means removing all routes and pushing the new screen.
  Future<dynamic> pushAndRemoveUntil(
      {required Widget widget, required BuildContext context}) {
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => widget), (route) => false);
  }

//This method is used to push a new screen (widget) onto the navigation stack without removing any existing routes.
  Future<dynamic> push(
      {required Widget widget, required BuildContext context}) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => widget),
    );
  }
}
