// //add to cart button pressed
// void addToCart(BuildContext context) {
// 	//show dialog box to ask user to confirm
// 	showDialog(
// 		context: context,
// 		builder: (context) => AlertDialog(
// 			content: Text("Add this item to your cart?"),
// 			actions: [
// 				//cancel button
// 				MaterialButton(
// 					onPress: () => Navigator.pop(context),
// 					child: Text("Cancel"),
// 				),
//
// 				//yes button
// 				MaterialButton(
// 					onPress: () {
// 						Navigator.pop(context),
//
// 						//add to cart
//
// 					},
// 					child: Text("Cancel"),
// 				),
// 			],
// 		),
// 	);
// }
//
//
// @override
// Widget build(BuildContext context) {
// 	return Container(
// 		decoration: BoxDecoration(
// 			color: Theme.of(context).colorScheme.primary,
// 			borderRadius: BorderRadius.circular(12),
// 		)
// 		margin: EdgeInsets.all(10),
// 		padding: EdgeInsets.all(25),
// 		width: 300,
// 		child: Column(
// 			crossAxisAlignment: CrossAxisAlignment.start,
// 			mainAxisAlignment: MainAxisAlignment.spaceBetween,
// 			children: [
// 				Column(
// 					crossAxisAlignment: CrossAxisAlignment.start,
// 					children: [
// 						//product image
// 						AspectRatio(
// 							aspectRatio: 1,
// 							child: Container(
// 								decoration: BoxDecoration(
// 									color: Theme.of(context).colorScheme.secondary,
// 									borderRadius: BorderRadius.circular(12),
// 								),
// 								width: double.infinity,
// 								padding: EdgeInsets.all(25),
// 								child: Icon(Icons.favorite),
// 							),
// 						),
//
// 						SizedBox(height: 25),
//
// 						//product name
// 						Text(
// 							product.name,
// 							style: TextStyle(
// 								fontWeight: FontWeight.bold,
// 								fontSize: 20,
// 							),
// 						),
//
// 						SizedBox(height: 10),
//
// 						//product desciption
// 						Text(
// 							product.description,
// 							style: TextStyle(
// 								color: Theme.of(context).colorScheme.inversePrimary,
// 							),
// 						),
//
// 						SizedBox(height: 25),
// 						//product price + add to cart button
// 						Row(
// 							mainAxisAlignment: MainAxisAlignment.spaceBetween,
// 							children: [
// 								//product price
// 								Text('\$' + product.price.toStringAsFixed(2)),
//
// 								//add to cart button
// 								Container(
// 									decoration: BoxDecoration(
// 										color: Theme.of(context).colorScheme.secondary,
// 										borderRadius: BorderRadius.circular(12),
// 									),
// 									child: IconButton(
// 										onPressed: () {},
// 										icon: Icon(Icons.add),
// 									),
// 								),
// 							],
// 						),
// 					]
// 				),
// 			],
// 		),
// 	);
// }