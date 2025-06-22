import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:flutter/material.dart';

class CatagoryChips extends StatefulWidget {
  const CatagoryChips({super.key});

  @override
  State<CatagoryChips> createState() => _CatagoryChipsState();
}

class _CatagoryChipsState extends State<CatagoryChips> {
  int selectedIndex = 0;
  final List<String> categories = [
    'All',
    'Electronics',
    'Fashion',
    'Home & Kitchen',
    'Beauty & Health',
    'Sports',
  ];
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(
              right: 12,
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: ChoiceChip(
                label: Text(
                  categories[index],
                  style: AppTextstyles.withColor(
                    selectedIndex == index
                        ? AppTextstyles.withWeight(
                            AppTextstyles.bodySmall,
                            FontWeight.w600,
                          )
                        : AppTextstyles.bodySmall,
                    selectedIndex == index
                        ? Colors.white
                        : isDark
                            ? Colors.white
                            : Colors.black,
                  ),
                ),
                selected: selectedIndex == index,
                onSelected: (bool selected) {
                  setState(() {
                    selectedIndex = selected ? index : selectedIndex;
                  });
                },
                backgroundColor: isDark ? Colors.grey[800] : Colors.grey[300],
                selectedColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: selectedIndex == index
                        ? Colors.transparent
                        : isDark
                            ? Colors.white54
                            : Colors.black54,
                  ),
                ),
                elevation: selectedIndex == index ? 2 : 0,
                pressElevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                labelPadding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                side: BorderSide(
                  color: selectedIndex == index
                      ? Colors.transparent
                      : isDark
                          ? Colors.white54
                          : Colors.black54,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
