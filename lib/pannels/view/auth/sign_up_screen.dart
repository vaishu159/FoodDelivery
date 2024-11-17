import 'package:flutter/material.dart';
import 'package:food_delivery/components/app_colors.dart';
import 'package:food_delivery/components/common_text.dart';
import 'package:food_delivery/components/common_textfield.dart';
import 'package:food_delivery/pannels/controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final con = Get.put<LoginController>(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding:
              const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 100),
          children: [
            const CommonText(
              text: "Create Account",
              color: AppColor.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            const SizedBox(height: 20),
            CommonTextField(
              labelText: "Email",
              con: con.emailCon,
            ),
            const SizedBox(height: 20),
            CommonTextField(
              labelText: "Password",
              con: con.passCon,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                final message = await con.registration(
                  email: con.emailCon.text,
                  password: con.passCon.text,
                );
                if (message!.contains('Success')) {
                  context.push('/LoginScreen');
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );
              },
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all(
                  const Size(double.infinity, 50),
                ),
                backgroundColor: WidgetStateProperty.all(AppColor.orange),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    side: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              child: const CommonText(
                text: "Create User",
                color: AppColor.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: const Alignment(1, 2),
              child: InkWell(
                onTap: () => context.go("/LoginScreen"),
                child: const CommonText(
                  text: "Go To Login",
                  fontWeight: FontWeight.bold,
                  textDecoration: TextDecoration.underline,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
