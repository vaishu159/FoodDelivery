import 'package:flutter/material.dart';
import 'package:food_delivery/components/app_colors.dart';
import 'package:food_delivery/components/common_text.dart';
import 'package:food_delivery/components/common_textfield.dart';
import 'package:food_delivery/pannels/controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final con = Get.put<LoginController>(LoginController());
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Form(
            key: _key,
            child: ListView(
              padding: const EdgeInsets.all(15),
              children: <Widget>[
                const SizedBox(height: 40),
                Image.asset(
                  'assets/images/foodLogo.jpg',
                  height: 150,
                ),
                const SizedBox(height: 40),
                CommonTextField(
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return 'Email is Required';
                    }
                    if (!RegExp(
                            r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$")
                        .hasMatch(value!)) {
                      return 'Please enter a valid Email';
                    }
                    return null;
                  },
                  labelText: "Email",
                  con: con.emailCon,
                ),
                const SizedBox(height: 20),
                CommonTextField(
                  obscureText: true,
                  validator: (v) {
                    if (v?.isEmpty ?? false) {
                      return 'Please enter some text';
                    }
                    if (v!.length < 6) {
                      return 'Must be more than 6 character';
                    }
                  },
                  labelText: "Password",
                  con: con.passCon,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    if (_key.currentState?.validate() ?? false)
                      con.login(context);
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
                    text: "Login",
                    color: AppColor.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: CommonText(
                    text: "Forgot Password",
                    textDecoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(height: 350),
                InkWell(
                  onTap: () => context.go("/SignUpScreen"),
                  child: const Center(
                    child: CommonText(
                      text: "Don't Have account? Sign up now",
                      textDecoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
