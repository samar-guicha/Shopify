import 'package:app1/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:app1/provider/app_provider.dart';
import 'package:app1/widgets/primary_button/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Account",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                appProvider.getUserInformation.image == null
                    ? const Icon(
                        Icons.person_outline,
                        size: 120,
                      )
                    : Image.network(appProvider.getUserInformation.image!),
                Text(
                  appProvider.getUserInformation.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  appProvider.getUserInformation.email,
                ),
                const SizedBox(
                  height: 12.0,
                ),
                SizedBox(
                  width: 130,
                  child: PrimaryButton(
                    title: "Edit Profile",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.shopping_bag_outlined),
                  title: const Text("Your Orders"),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.favorite_outline),
                  title: const Text("Favorites "),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.info_outline),
                  title: const Text("About Us"),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.support_outlined),
                  title: const Text("Support "),
                ),
                ListTile(
                  onTap: () {
                    FirebaseAuthHelper.instance.signOut();
                    setState(() {});
                  },
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text("Logout "),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                const Text("Version 1.2.0"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
