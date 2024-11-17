import 'package:flutter/material.dart';
import 'package:food_delivery/components/app_colors.dart';
import 'package:food_delivery/components/common_text.dart';
import 'package:food_delivery/pannels/controller/home_controller.dart';
import 'package:food_delivery/pannels/model/food_model.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class MenuItemsScreen extends StatelessWidget {
  final Hotel? hotelData;

  MenuItemsScreen({super.key, this.hotelData});

  final con = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          context.push('/HomePage/MenuItemsScreen/MyCart',
              extra: hotelData?.name ?? '');
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
          text: "Proceed to Cart",
          color: AppColor.white,
          fontWeight: FontWeight.bold,
          fontSize: 21,
        ),
      ),
      appBar: AppBar(
        title: Text(
          hotelData?.name ?? '',
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(15),
            child: CommonText(
              fontWeight: FontWeight.w600,
              fontSize: 19,
              text: "Choose from menu listed below:",
            ),
          ),
          const Divider(),
          ListView.builder(
            shrinkWrap: true,
            itemCount: hotelData?.menu?.length ?? 0,
            itemBuilder: (context, index) => itemView(
              hotelData!.menu![index],
            ),
          ),
        ],
      ),
    );
  }

  itemView(Menu data) {
    return Container(
      margin: const EdgeInsets.all(9.0),
      padding: const EdgeInsets.only(left: 16, bottom: 6),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: verticalText(
              data.item ?? '',
              data.price.toString(),
            ),
          ),
          Expanded(
            child: Obx(
              () => ElevatedButton(
                onPressed: () {
                  con.toggleCart(data);
                },
                style: ButtonStyle(
                  fixedSize: const WidgetStatePropertyAll(Size(10, 10)),
                  backgroundColor: WidgetStateProperty.all(
                      con.menuCart.contains(data)
                          ? Colors.orangeAccent
                          : AppColor.orange),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
                child: CommonText(
                  text: con.menuCart.contains(data) ? "Remove" : "Add",
                  color: AppColor.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  verticalText(String text1, String text2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(text: text1),
        CommonText(text: text2),
      ],
    );
  }
}
