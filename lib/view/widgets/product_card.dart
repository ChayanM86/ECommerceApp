import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final ScreenWidth = MediaQuery.of(context).size.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      constraints: BoxConstraints(
        maxWidth: ScreenWidth * 0.9,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.5)
                : Colors.grey.withOpacity(0.5),
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              //image
              AspectRatio(
                aspectRatio: 1.2,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.network(
                    product.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),

              //favorite Button
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: Icon(
                    product.isfavorite ? Icons.favorite : Icons.favorite_border,
                    color: product.isfavorite
                        ? Theme.of(context).primaryColor
                        : isDark
                            ? Colors.grey[400]
                            : Colors.grey,
                  ),
                  onPressed: () {
                    // Handle favorite toggle
                  },
                ),
              ),
              if (product.oldprice != null)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),

                    //discount percentage
                    child: Text(
                      '${calculaculateDiscount(product.price, product.oldprice!)}% OFF',
                      style: AppTextstyles.withColor(
                          AppTextstyles.withWeight(
                              AppTextstyles.bodySmall, FontWeight.bold),
                          Colors.white),
                    ),
                  ),
                ),
            ],
          ),

          //product details
          Padding(
            padding: EdgeInsets.all(ScreenWidth * 0.02),
            child: Column(
              children: [
                Text(
                  product.name,
                  style: AppTextstyles.withColor(
                    AppTextstyles.withWeight(
                        AppTextstyles.bodySmall, FontWeight.bold),
                    Theme.of(context).textTheme.bodyLarge!.color!,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: ScreenWidth * 0.01),
                Text(
                  product.category,
                  style: AppTextstyles.withColor(
                    AppTextstyles.withWeight(
                        AppTextstyles.bodySmall, FontWeight.bold),
                    Theme.of(context).textTheme.bodyLarge!.color!,
                  ),
                ),
                SizedBox(height: ScreenWidth * 0.01),
                Row(
                  children: [
                    Text(
                      // ignore: unnecessary_string_escapes
                      "\₹${product.price.toStringAsFixed(2)}",
                      style: AppTextstyles.withColor(
                        AppTextstyles.withWeight(
                            AppTextstyles.bodySmall, FontWeight.bold),
                        Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    ),
                    if (product.oldprice != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          // ignore: unnecessary_string_escapes
                          "\₹${product.oldprice!.toStringAsFixed(2)}",
                          style: AppTextstyles.withColor(
                            AppTextstyles.bodySmall,
                            isDark ? Colors.grey[400]! : Colors.grey[600]!,
                          ).copyWith(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Calculate discount percentage
  int calculaculateDiscount(double currentprice, double oldprice) {
    return (((oldprice - currentprice) / oldprice) * 100).round();
  }
}
