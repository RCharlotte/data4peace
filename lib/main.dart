import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'backend/main_binding.dart';
import 'frontend/auth/login.dart';
import 'frontend/ui/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var keyParseApplicationId = "QyGv9ff1t2eK2WSKLRh93dmwCOQFP9QofXREJmcT";
  var keyParseServerUrl = "https://parseapi.back4app.com";
  var keyParseClientKey = "gB6rvnwMqhi2fX9VDT4eASo2r0nAy4sA57LuxaYb";

  var store = await CoreStoreSembastImp.getInstance(password: "mobipeace");

  await Parse().initialize(keyParseApplicationId, keyParseServerUrl,
      clientKey: keyParseClientKey, autoSendSessionId: true, coreStore: store);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MainBinding(),
      title: 'MobiPeace',
      theme: ThemeData(
        // textTheme: GoogleFonts.oxygenTextTheme(
        //   Theme.of(context).textTheme,
        // ),
        primarySwatch: Colors.teal,
      ),
      //home: const SplashScreen(),
      home: const Home(),
      builder: (BuildContext context, Widget? child) {
        return FlutterSmartDialog(child: child);
      },
    );
  }
}
