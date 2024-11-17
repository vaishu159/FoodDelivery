import 'package:flutter/material.dart';
import 'package:food_delivery/components/common_text.dart';
import 'package:food_delivery/components/app_colors.dart';
import 'package:food_delivery/components/horizontal_view.dart';
import 'package:food_delivery/pannels/controller/home_controller.dart';
import 'package:food_delivery/pannels/model/food_model.dart';
import 'package:food_delivery/utils/responsive.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeController = Get.put<HomeController>(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () => filterDialog(context),
            child: const Icon(
              Icons.sort_outlined,
              color: AppColor.white,
            ),
          ),
          const SizedBox(width: 10),
        ],
        title: const Text(
          "All Restaurants",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Obx(
        () => Responsive.isMobile(context)
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: homeController.model.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => context.go(
                      "/HomePage/MenuItemsScreen",
                      extra: homeController.model[index],
                    ),
                    child: hotelViewCart(homeController.model[index]),
                  );
                },
              )
            : GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of columns for desktop view
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 4 / 3, // Adjust to fit restaurant cards
                ),
                itemCount: homeController.model.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => context.go(
                      "/HomePage/MenuItemsScreen",
                      extra: homeController.model[index],
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(2, 2),
                              blurRadius: 3,
                              color: Colors.grey),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: Image.asset(
                                  homeController.model[index].image ??
                                      "ass"
                                          "ets/im"
                                          "ages/default"
                                          ".png",
                                  height: 150,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: InkWell(
                                  onTap: () {
                                    homeController.toggleFavorite(
                                        homeController.model[index]);
                                  },
                                  child: Obx(
                                    () => Icon(
                                      homeController.favoriteRestaurants
                                              .contains(
                                                  homeController.model[index])
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: CommonText(
                                        text:
                                            homeController.model[index].name ??
                                                "",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: CommonText(
                                        text: homeController.model[index].rating
                                            .toString(),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                CommonText(
                                  text: homeController.model[index].name ??
                                      "No description available.",
                                  fontSize: 16,
                                  color: Colors.grey.shade700,
                                  maxLines:
                                      2, // Truncate description for clean UI
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const CommonText(
                                      text: "Price for one: ",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                    CommonText(
                                      text:
                                          "₹${homeController.model[index].pricePerPerson}",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: AppColor.orange,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 230,
            color: AppColor.orange,
            child: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 60,
                    child: Icon(Icons.person),
                  ),
                  SizedBox(height: 10),
                  CommonText(
                    text: "John Doe",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                  CommonText(
                    text: "91+ 9673108423",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          horizontalView(
              onTap: () => context.pop(), Icons.home_outlined, "Home"),
          horizontalView(Icons.person_2_outlined, "My Profile"),
          horizontalView(onTap: () {
            context.go("/HomePage/FavoriteRestaurantsPage");
          }, Icons.favorite_border_outlined, "Favorite Restaurants"),
          horizontalView(Icons.history, "Order History"),
          horizontalView(Icons.help_outline, "FAQs"),
          horizontalView(
            Icons.logout_outlined,
            "Log out",
            onTap: () async => homeController.signOut(context),
          ),
        ],
      ),
    );
  }

  filterDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Sort By?"),
        actions: [
          TextButton(
            onPressed: () {
              homeController.selected.value = "";
              Navigator.pop(context);
            },
            child: const CommonText(
              text: "Cancel",
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextButton(
            onPressed: () {
              homeController.sortData(); // Sort the data
              Navigator.pop(context); // Close dialog after sorting
            },
            child: const CommonText(
              text: "Ok",
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
        content: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: homeController.filterValue
                .map(
                  (e) => Row(
                    children: [
                      Radio<String>(
                        value: e,
                        groupValue: homeController.selected.value,
                        onChanged: (v) {
                          homeController.selected.value = v ?? "";
                        },
                      ),
                      CommonText(text: e),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget hotelViewCart(Hotel restaurant) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        boxShadow: const [
          BoxShadow(offset: Offset(3, 3), blurRadius: 1),
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                restaurant.image ?? "",
                fit: BoxFit.contain,
              ),
              Positioned(
                top: 10,
                right: 10,
                child: InkWell(
                  onTap: () {
                    homeController
                        .toggleFavorite(restaurant); // Toggle favorite status
                  },
                  child: Obx(
                    () => Icon(
                      homeController.favoriteRestaurants.contains(restaurant)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CommonText(
                        text: restaurant.name ?? "",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: CommonText(
                        text: restaurant.rating.toString(),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const CommonText(
                      text: "For One: ",
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    CommonText(
                      text: " ₹${restaurant.pricePerPerson}",
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
