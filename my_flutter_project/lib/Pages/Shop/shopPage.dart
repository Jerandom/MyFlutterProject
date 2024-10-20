// return Scaffold(
// 	appBar: AppBar(
// 		backgroundColor: Colors.tranparent,
// 		elvation: 0,
// 		foregroundColor: Theme.of(context).colorScheme.InversePrimary,
// 		title: Text("Shop Page"),
// 	),
//
// 	drawer: ShopDrawer(),
// 	backgroundColor: Theme.of(context).colorScheme.background,
// 	body: ListView(
// 		children: [
// 			Center(
// 				child: Text(
// 					"Pick from a selected list of products",
// 					style: TextStyle(
// 						color: Theme.of(context).colorScheme.InversePrimary),
// 					),
// 				),
//
// 			//product list
// 			SizedBox(
// 				height: 500,
// 				child: ListView.builder(
// 					itemCOunt: products.length,
// 					scrollDirection: Axis.horizontal,
// 					padding: EdgeInsets.all(15),
// 					itemBuilder: (context, index) {
// 						//get each individual products from shop
// 						final products = products[index];
//
// 						return MyProductTile(product: product);
// 					},
// 				),
// 			)
// 		],
// 	),
// );
//