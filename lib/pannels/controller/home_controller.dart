import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pannels/model/food_model.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  RxList<Hotel> model = <Hotel>[].obs;
  RxString selected = "".obs;
  List<String> filterValue = <String>[
    "Cost(Low to High)",
    "Cost(High to Low)",
    "Rating",
  ].obs;
  RxList<Hotel> favoriteRestaurants = <Hotel>[].obs;
  RxList<Menu> menuCart = <Menu>[].obs;

  void toggleFavorite(Hotel restaurant) {
    if (favoriteRestaurants.contains(restaurant)) {
      favoriteRestaurants.remove(restaurant); // Remove from favorites
    } else {
      favoriteRestaurants.add(restaurant); // Add to favorites
    }
  }

  void toggleCart(Menu menu) {
    if (menuCart.contains(menu)) {
      menuCart.remove(menu); // Remove from favorites
    } else {
      menuCart.add(menu); // Add to favorites
    }
  }

  sortData() {
    if (selected.value == "") {
    } else if (selected.value == "Cost(Low to High)") {
      model.sort(
          (a, b) => (a.pricePerPerson ?? 0).compareTo(b.pricePerPerson ?? 0));
    } else if (selected.value == "Cost(High to Low)") {
      model.sort(
          (a, b) => (b.pricePerPerson ?? 0).compareTo(a.pricePerPerson ?? 0));
    } else if (selected.value == "Rating") {
      model.sort(
        (a, b) => (b.rating ?? 0).compareTo(a.rating ?? 0),
      );
    }
  }

  getData() {
    Hotel data1 = Hotel(
        name: "Jaya Raman Hotel",
        image: "assets/images/h1.jpg",
        menu: [
          Menu(item: "Biryani", price: 300),
          Menu(item: "veg Pulav", price: 250),
          Menu(item: "samba Pulav", price: 100),
          Menu(item: "Roti", price: 10),
        ],
        pricePerPerson: 89,
        rating: 2);
    Hotel data = Hotel(
        name: "Sita Hotel",
        image: "assets/images/h2.jpg",
        menu: [
          Menu(item: "Pasta", price: 12),
          Menu(item: "Burger", price: 60),
          Menu(item: "Mango Juce", price: 30),
        ],
        pricePerPerson: 120,
        rating: 4);
    Hotel data2 = Hotel(
        name: "Run Paradise",
        image: "assets/images/h3.jpg",
        menu: [
          Menu(item: "Pizza", price: 100),
          Menu(item: "pasta", price: 160),
          Menu(item: "TandooriPizza", price: 130),
        ],
        pricePerPerson: 100,
        rating: 5);
    Hotel data3 = Hotel(
        name: "Aditi Hotel",
        image: "assets/images/h4.jpg",
        menu: [
          Menu(item: "Idly", price: 15),
          Menu(item: "Idly fry", price: 15),
          Menu(item: "Roasted idly", price: 15),
          Menu(item: "Rotten Soup idly", price: 15),
        ],
        pricePerPerson: 150,
        rating: 3);
    model.addAll([data3, data2, data, data1]); // Initialize model with data
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> signOut(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await FirebaseAuth.instance.signOut();
    pref.setBool('isLogin', false);
    context.pushReplacement("/");
  }
}
