import 'package:app1/constants/asset_images.dart';
import 'package:app1/constants/routes.dart';
import 'package:app1/screens/auth_ui/login/login.dart';
import 'package:app1/screens/auth_ui/sign_up/sign_up.dart';
import 'package:app1/widgets/primary_button/primary_button.dart';
import 'package:app1/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopTitles(
                  title: "welcome",
                  subtitle: "buy any items from Shopify app",
                ),
                Center(
                  child: Image.asset(
                    AssetsImages.instance.welcomeImage,
                    //width: 400,
                    //height: 400,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //give it button effect
                    CupertinoButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      child: const Icon(
                        Icons.facebook,
                        size: 35,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    CupertinoButton(
                      onPressed: () {},
                      child: Image.asset(
                        AssetsImages.instance.googleLogo,
                        scale: 30.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                PrimaryButton(
                  title: "login",
                  onPressed: () {
                    Routes.instance.push(widget: const Login(), context: context);
                  },
                ),
                const SizedBox(
                  height: 18.0,
                ),
                PrimaryButton(
                  title: "Sign up",
                  onPressed: () {
                    Routes.instance
                        .push(widget: const SignUp(), context: context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
