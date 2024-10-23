import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageTileWidget extends StatelessWidget {
  final String imageId;
  final String imageUrl;
  final String imageAuthor;
  final void Function()? onPressed;

  const ImageTileWidget({
    super.key,
    required this.imageId,
    required this.imageUrl,
    required this.imageAuthor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[200],
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                spreadRadius: 5,
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                // Text block
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      imageId,
                      style: const TextStyle(fontSize: 12),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      imageAuthor,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  placeholder: (context, imageUrl) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, imageUrl, error) =>
                      const Icon(Icons.error),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      );
}
