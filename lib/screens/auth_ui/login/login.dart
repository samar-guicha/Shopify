// ignore_for_file: use_build_context_synchronously

import 'package:app1/constants/constants.dart';
import 'package:app1/constants/routes.dart';
import 'package:app1/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:app1/screens/auth_ui/sign_up/sign_up.dart';
import 'package:app1/screens/custom_button_bar/custom_button_bar.dart';
import 'package:app1/widgets/primary_button/primary_button.dart';
import 'package:app1/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopTitles(
                    subtitle: "Welcome back to shopify app", title: "Login"),
                const SizedBox(
                  height: 46.0,
                ),
                TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                    hintText: "E-mail ",
                    prefixIcon: Icon(
                      Icons.email_outlined,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                TextFormField(
                  controller: password,
                  obscureText: isShowPassword,
                  decoration: InputDecoration(
                    hintText: "Password ",
                    prefixIcon: const Icon(
                      Icons.password_sharp,
                    ),
                    suffixIcon: CupertinoButton(
                        onPressed: () {
                          setState(() {
                            isShowPassword = !isShowPassword;
                            //print(isShowPassword);
                          });
                        },
                        padding: EdgeInsets.zero,
                        child: const Icon(
                          Icons.visibility,
                          color: Colors.grey,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 36.0,
                ),
                PrimaryButton(
                  title: "Login",
                  onPressed: () async {
                    bool isValidated = loginValidation(email.text, password.text);
                    if (isValidated) {
                      bool isLogined = await FirebaseAuthHelper.instance
                          .login(email.text, password.text, context);
                      if (isLogined) {
                        Routes.instance.pushAndRemoveUntil(
                            widget: const CustomButtomBar(), context: context);
                      }
                    }
                  },
                ),
                const SizedBox(
                  height: 24.0,
                ),
                const Center(child: Text("Don't have an account?")),
                const SizedBox(
                  height: 12.0,
                ),
                Center(
                  child: CupertinoButton(
                    onPressed: () {
                      Routes.instance
                          .push(widget: const SignUp(), context: context);
                    },
                    child: Text(
                      "Create an account",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
