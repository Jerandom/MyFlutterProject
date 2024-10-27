import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  final List<Map<String, dynamic>> gridItems;
  final Function(int) onTap;

  const GridViewWidget({
    super.key,
    required this.gridItems,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: gridItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        crossAxisSpacing: 8.0, // Space between columns
        mainAxisSpacing: 8.0, // Space between rows
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => onTap(index),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  color: Colors.black,
                  child: Image.asset(
                    gridItems[index]['image'] as String,
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 8.0),

              Text(
                gridItems[index]['text'],
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        );
      },
    );
  }
}
