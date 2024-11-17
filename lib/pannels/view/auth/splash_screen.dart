import 'package:flutter/material.dart';
import 'package:food_delivery/components/common_text.dart';
import 'package:food_delivery/components/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    if (pref.getBool("isLogin") ?? false) {
      context.pushReplacement("/HomePage");
    } else {
      context.pushReplacement("/LoginScreen");
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () => checkLogin());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.orange.withOpacity(0.4),
      body: const Center(
        child: CommonText(
          text: "Welcome to Food Delivery",
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
