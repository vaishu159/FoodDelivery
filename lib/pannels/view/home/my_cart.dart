import 'package:flutter/material.dart';
import 'package:food_delivery/components/app_colors.dart';
import 'package:food_delivery/components/common_text.dart';
import 'package:food_delivery/pannels/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class MyCart extends StatelessWidget {
  final String? hotelName;
  MyCart({super.key, this.hotelName});

  final HomeController con = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          context.push('/HomePage/MenuItemsScreen/OrderSuccess');
          con.menuCart.clear();
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
        child: Obx(() {
          final totalPrice = con.menuCart.fold<int>(
            0,
            (sum, item) => sum + int.parse(item.price.toString()),
          );
          return CommonText(
            text: "Place Order (Total: Rs $totalPrice)",
            color: AppColor.white,
            fontWeight: FontWeight.bold,
            fontSize: 21,
          );
        }),
      ),
      appBar: AppBar(
        title: const Text(
          "My Cart",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: CommonText(
              fontWeight: FontWeight.w600,
              fontSize: 19,
              text: "Ordering From: $hotelName",
            ),
          ),
          const Divider(),
          Obx(() {
            if (con.menuCart.isEmpty) {
              return const Padding(
                padding: EdgeInsets.all(15.0),
                child: CommonText(
                  text: "Your cart is empty!",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              );
            }
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: con.menuCart.length,
              itemBuilder: (context, index) {
                final item = con.menuCart[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: item.item,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      CommonText(
                        text: "₹${item.price}",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
