// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// class ThemeController extends GetxController {
//   final _box = GetStorage();
//   final _key = 'isDarkMode';

//   ThemeMode get theme => _loadTheme() ? ThemeMode.dark : ThemeMode.light;
//   bool get isDarkMode => _loadTheme();

//   bool _loadTheme() => _box.read(_key) ?? false;
//   void saveTheme(bool isdarkMode) => _box.write(_key, isDarkMode);
//   void toggleTheme() {
//     Future.delayed(const Duration(milliseconds: 50), () {
//       Get.changeThemeMode(_loadTheme() ? ThemeMode.light : ThemeMode.dark);
//       saveTheme(!_loadTheme());
//       update();
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  ThemeMode get theme => _loadTheme() ? ThemeMode.dark : ThemeMode.light;
  bool get isDarkMode => _loadTheme();

  bool _loadTheme() => _box.read(_key) ?? false;
  void saveTheme(bool isdarkMode) => _box.write(_key, isdarkMode);

  void toggleTheme() {
    bool newMode = !_loadTheme();
    Get.changeThemeMode(newMode ? ThemeMode.dark : ThemeMode.light);
    saveTheme(newMode);
    update();
  }
}
