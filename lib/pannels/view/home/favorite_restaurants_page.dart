import 'package:flutter/material.dart';
import 'package:food_delivery/components/app_colors.dart';
import 'package:food_delivery/components/common_text.dart';
import 'package:food_delivery/pannels/controller/home_controller.dart';
import 'package:get/get.dart';

class FavoriteRestaurantsPage extends StatelessWidget {
  const FavoriteRestaurantsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: const CommonText(
          text: "Favorite Restaurants",
          color: AppColor.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: AppColor.orange,
      ),
      body: Obx(
        () => homeController.favoriteRestaurants.isNotEmpty
            ? ListView.builder(
                itemCount: homeController.favoriteRestaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = homeController.favoriteRestaurants[index];
                  return Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(color: Colors.grey),
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(blurRadius: 1),
                            ],
                          ),
                          child: Image.asset(
                            restaurant.image ?? '',
                          ),
                        ),
                        const SizedBox(width: 20),
                        CommonText(
                          text: restaurant.name ?? '',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ); // Reuse the same widget to display
                  // favorites
                },
              )
            : const Center(
                child: CommonText(
                text: "No Favorite Restaurants",
              )),
      ),
    );
  }
}
