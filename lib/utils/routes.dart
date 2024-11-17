import 'package:food_delivery/pannels/model/food_model.dart';
import 'package:food_delivery/pannels/view/auth/login_screen.dart';
import 'package:food_delivery/pannels/view/auth/sign_up_screen.dart';
import 'package:food_delivery/pannels/view/auth/splash_screen.dart';
import 'package:food_delivery/pannels/view/home/favorite_restaurants_page.dart';
import 'package:food_delivery/pannels/view/home/home_page.dart';
import 'package:food_delivery/pannels/view/home/menu_items_screen.dart';
import 'package:food_delivery/pannels/view/home/my_cart.dart';
import 'package:food_delivery/pannels/view/home/order_success.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'SplashScreen',
        path: "/",
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: 'LoginScreen',
        path: '/LoginScreen',
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
          name: 'HomePage',
          path: '/HomePage',
          builder: (context, state) => HomePage(),
          routes: [
            GoRoute(
              name: 'FavoriteRestaurantsPage',
              path: '/FavoriteRestaurantsPage',
              builder: (context, state) => const FavoriteRestaurantsPage(),
            ),
            GoRoute(
              name: 'MenuItemsScreen',
              path: '/MenuItemsScreen',
              builder: (context, state) {
                final Hotel hotelData = state.extra as Hotel;
                return MenuItemsScreen(
                  hotelData: hotelData,
                );
              },
              routes: [
                GoRoute(
                  name: 'MyCart',
                  path: '/MyCart',
                  builder: (context, state) {
                    final String hotel = state.extra as String;
                    return MyCart(
                      hotelName: hotel,
                    );
                  },
                ),
                GoRoute(
                  name: 'OrderSuccess',
                  path: '/OrderSuccess',
                  builder: (context, state) => const OrderSuccess(),
                )
              ],
            ),
          ]),
      GoRoute(
        name: 'SignupScreen',
        path: '/SignupScreen',
        builder: (context, state) => SignupScreen(),
      )
    ],
  );
}
