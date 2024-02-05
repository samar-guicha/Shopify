import 'package:app1/constants/theme.dart';
import 'package:app1/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:app1/firebase_helper/firebase_options/firebase_options.dart';
import 'package:app1/provider/app_provider.dart';
import 'package:app1/screens/auth_ui/welcome/welcome.dart';
import 'package:app1/screens/custom_button_bar/custom_button_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseConfig.platformOptions,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopify',
        theme: themedata,
        home: StreamBuilder(
            stream: FirebaseAuthHelper.instance.getAuthChange,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const CustomButtomBar();
              }
              return const Welcome();
            }),
      ),
    );
  }
}
