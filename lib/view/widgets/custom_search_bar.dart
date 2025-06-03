import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          style: AppTextstyles.withColor(AppTextstyles.buttonMedium,
              Theme.of(context).textTheme.bodyLarge!.color ?? Colors.black),
          decoration: InputDecoration(
            filled: true,
            fillColor: isDark ? Colors.grey[800]! : Colors.grey[100]!,
            hintText: 'Search for products',
            hintStyle: AppTextstyles.withColor(
              AppTextstyles.buttonMedium,
              isDark ? Colors.grey[300]! : Colors.grey[700]!,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: isDark ? Colors.grey[300] : Colors.grey[700],
            ),
            suffixIcon: Icon(
              Icons.tune,
              color: isDark ? Colors.grey[300] : Colors.grey[700],
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1,
              ),
            ),
          ),
        ));
  }
}
