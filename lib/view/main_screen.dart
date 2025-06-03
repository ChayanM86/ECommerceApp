import 'package:ecommerce_app/controllers/navigation_controller.dart';
import 'package:ecommerce_app/controllers/theme_controller.dart';
import 'package:ecommerce_app/view/account_screen.dart';
import 'package:ecommerce_app/view/home_screen.dart';
import 'package:ecommerce_app/view/shopping_screen.dart';
import 'package:ecommerce_app/view/widgets/custom_bottom_navbar.dart';
import 'package:ecommerce_app/view/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController =
        Get.put(NavigationController());
    // final isDark = Theme.of(context).brightness == Brightness.dark;
    return GetBuilder<ThemeController>(
      // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
      builder: (ThemeController) => Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 1200),
          child: Obx(
            () => IndexedStack(
              key: ValueKey(navigationController.currentIndex),
              index: navigationController.currentIndex,
              children: const [
                HomeScreen(),
                ShoppingScreen(),
                WishlistScreen(),
                AccountScreen(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const CustomBottomNavbar(),
      ),
    );
  }
}
