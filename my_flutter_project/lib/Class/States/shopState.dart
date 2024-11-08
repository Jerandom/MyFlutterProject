class ShopState {
  final List<Map<String, dynamic>> shopItems;

  ShopState({required this.shopItems});

  // A convenient method to create the initial state
  factory ShopState.initial() => ShopState(
        shopItems: [
          {
            "imagePath": "assets/images/ic_launcher.png",
            "title": "shirt",
            "description": "this is a shirt",
            "price": 25.0,
          },
          {
            "imagePath": "assets/images/ic_launcher.png",
            "title": "pants",
            "description": "this is a pants",
            "price": 40.0,
            "discount": 5.0, // Only pants have a discount
          },
          {
            "imagePath": "assets/images/ic_launcher.png",
            "title": "shoe",
            "description": "this is a shoe",
            "price": 50.0,
          },
        ],
      );

  // Method to create a copy of the state with some fields replaced
  ShopState copyWith({
    List<Map<String, dynamic>>? setShopItems,
  }) => ShopState(
        shopItems: setShopItems ?? shopItems,
      );
}
