 import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ManagerClass/ImageManager.dart';

class ImageItem{
  final List<String> imageID;
  final List<String> imageUrl;
  final List<String> imageAuthor;

  const ImageItem({
    required this.imageID,
    required this.imageUrl,
    required this.imageAuthor,
  });

  factory ImageItem.fromJson(Map<String, dynamic> json) => ImageItem(
    imageID: List<String>.from(json['id'] as List<dynamic>),
    imageUrl: List<String>.from(json['url'] as List<dynamic>),
    imageAuthor: List<String>.from(json['author'] as List<dynamic>),
  );

  // A convenient method to create initial state
  factory ImageItem.initial() => const ImageItem(
    imageID: [],
    imageUrl: [],
    imageAuthor: [],
  );

  // Method to create a copy of the state with some fields replaced
  ImageItem copyWith({
    List<String>? setImageID,
    List<String>? setImageUrl,
    List<String>? setImageAuthor,
  }) => ImageItem(
    imageID: setImageID?? imageID,
    imageUrl: setImageUrl?? imageUrl,
    imageAuthor: setImageAuthor?? imageAuthor,
  );
}

// Define a state notifier for managing the app state
class ImageState extends StateNotifier<ImageItem> {
  final ImageManager imageManager;

  ImageState(this.imageManager) : super(ImageItem.initial()) {
    //constructor
  }

  Future<void> loadMoreImages(int page, int limit) async {
    try {
      final newImages = await imageManager.fetchImages(page, limit);
      decodeImageJson(newImages);

    } catch (e) {
      throw Exception("Failed to load images: $e");
    }
  }

  void decodeImageJson(List<dynamic> images){
    List<String> imageId =  [];
    List<String> imageUrl =  [];
    List<String> imageAuthor =  [];

    // decoding the json data
    for (var json in images) {
      imageId.add(json['id'] as String);
      imageUrl.add(json['download_url'] as String);
      imageAuthor.add(json['author'] as String);
    }

    // update the state
    state = state.copyWith(
      setImageID: [...state.imageID, ...imageId],
      setImageUrl: [...state.imageUrl, ...imageUrl],
      setImageAuthor: [...state.imageAuthor, ...imageAuthor],
    );
  }
}

// Define a provider for ImageManager
final imageManagerStateProvider = Provider<ImageManager>((ref) {
  return ImageManager();
});

// Define a provider for StateManager
final imageStateProvider = StateNotifierProvider<ImageState, ImageItem>((ref) {
  final imageManager = ref.watch(imageManagerStateProvider);
  return ImageState(imageManager);
});
