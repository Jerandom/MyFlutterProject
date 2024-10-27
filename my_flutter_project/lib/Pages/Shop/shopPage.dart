// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter/material.dart';
//
// class MyShopPage extends ConsumerStatefulWidget {
//   const MyShopPage({super.key});
//
//   @override
//   ConsumerState<MyShopPage> createState() => _MyShopPageState();
// }
//
// class _MyShopPageState extends ConsumerState<MyShopPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         foregroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text("Shop Page"),
//       ),
//       body: ListView(
//         children: [
//           Center(
//             child: Text(
//               "Pick from a selected list of products",
//               style: TextStyle(
//                   color: Theme.of(context).colorScheme.inversePrimary),
//             ),
//           ),
//
//           //product list
//           SizedBox(
//             height: 500,
//             child: ListView.builder(
//               itemCount: products.length,
//               scrollDirection: Axis.horizontal,
//               padding: EdgeInsets.all(15),
//               itemBuilder: (context, index) {
//                 //get each individual products from shop
//                 final products = products[index];
//
//                 return MyProductTile(product: product);
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
