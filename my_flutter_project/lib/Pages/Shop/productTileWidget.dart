import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final Map<String, dynamic> shopItem;
  final VoidCallback? onTap;

  const ProductTileWidget({
    super.key,
    required this.shopItem,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Theme.of(context).colorScheme.secondary,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product image
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: double.infinity,
                    padding: EdgeInsets.all(25),
                    child: Image.asset(
                      shopItem['imagePath'],
                      width: 100, 
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 25),

                // Product title
                Text(
                  shopItem['title'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10),

                // Product description
                Text(
                  shopItem['description'],
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                SizedBox(height: 25),

                // Product price
                Text('\$' + shopItem['price'].toStringAsFixed(2)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
