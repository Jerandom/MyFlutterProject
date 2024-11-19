import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_project/Pages/Shop/productTileWidget.dart';

import '../../Class/Providers/shopProvider.dart';

class MyShopPage extends ConsumerStatefulWidget {
  const MyShopPage({super.key});

  @override
  ConsumerState<MyShopPage> createState() => _MyShopPageState();
}

class _MyShopPageState extends ConsumerState<MyShopPage> {
  @override
  Widget build(BuildContext context) {
    final shopState = ref.watch(shopProvider);

    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Text(
              "Pick from a selected list of products",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),

          //product list
          SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: shopState.shopItems.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(15),
              itemBuilder: (context, index) {
                // Pass each shopItem to ProductTileWidget
                return ProductTileWidget(
                  shopItem: shopState.shopItems[index],
                );
              }
            ),
          )
        ],
      ),
    );
  }
}
