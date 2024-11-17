import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/components/app_colors.dart';
import 'package:food_delivery/utils/routes.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp.router(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              titleTextStyle: const TextStyle(color: AppColor.white),
              backgroundColor: AppColor.orange,
              iconTheme: const IconThemeData(color: AppColor.white))),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoutes().router,
    ),
  );
}
