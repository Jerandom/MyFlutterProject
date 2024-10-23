import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  final List<String> imageUrls;

  const GridViewWidget({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://example.com/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // GridView on top of background
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: imageUrls.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of items per row
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(imageUrls[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
