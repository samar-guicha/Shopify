import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage(String message) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Builder(builder: (context) {
      return SizedBox(
        width: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(
              color: Color(0xffe16555),
            ),
            const SizedBox(
              height: 18.0,
            ),
            Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("Loading ..."),
            )
          ],
        ),
      );
    }),
  );
  showDialog(
      //click on screen is denied
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      });

  String getMessageFromErrorCode(String errorCode) {
    switch (errorCode) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
        return "Email already used. Go to login page.";
      case "account-exists-withdifferent-credential":
        return "Email already used. Go to login page.";
      case "email-already-in-use":
        return "Email already used. Go to login page.";
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return "Wrong Paasword";
      case "ERROR_USER_NOT_FOUND":
        return "No user found with this email.";
      case "user-not-found":
        return "No user found with this email.";
      case "ERROR_USER_DISABLED":
        return "User disabled.";
      case "user-disabled":
        return "User disabled.";
      case "ERROE_TOO_MANY_REQUESTS":
        return "Too many requestes to log into this account.";
      case "operation-not-allowed":
        return "Too many requestes to log into this account.";
      case "ERROE_OPEARTION_NOT_ALLOWED":
        return "Too many requestes to log into this account.";
      case "ERROR_INVALID_EMAIL":
        return "Email adress is invalid";
      case "invalid-email":
        return "Email adress is invalid";
      default:
        return "Login failed. Please try again";
    }
  }
}

bool loginValidation(String email, String password) {
  if (password.isEmpty && email.isEmpty) {
    showMessage("Both fields are empty.");
    return false;
  } else if (email.isEmpty) {
    showMessage("Email is empty.");
    return false;
  } else if (password.isEmpty) {
    showMessage("Password is empty.");
    return false;
  } else {
    return true;
  }
}

bool signUpValidation(
    String email, String password, String name, String phone) {
  if (password.isEmpty && email.isEmpty && phone.isEmpty && name.isEmpty) {
    showMessage("All fields are empty.");
    return false;
  } else if (email.isEmpty) {
    showMessage("Email is empty.");
    return false;
  } else if (password.isEmpty) {
    showMessage("Password is empty.");
    return false;
  } else if (name.isEmpty) {
    showMessage("Name is empty.");
    return false;
  } else if (phone.isEmpty) {
    showMessage("Phone is empty.");
    return false;
  } else {
    return true;
  }
}
