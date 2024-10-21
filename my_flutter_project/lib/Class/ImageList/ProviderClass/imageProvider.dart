import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

import '../StateClass/ImageState.dart';

// Define a state notifier for managing the app state
class ImageProvider extends StateNotifier<ImageState> {
  ImageProvider() : super(ImageState.initial()) {
    //constructor
  }

  Future<void> loadAndDecodeImages(int page, int limit) async {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        sendTimeout: const Duration(seconds: 8),
      ),
    );

    try {
      // fetch images from the API
      final response = await dio.get(
        'https://picsum.photos/v2/list',
        queryParameters: {
          'page': page,
          'limit': limit,
        },
      );

      if(response.statusCode == 200) {
        // decode and process images
        final newImages = response.data;
        decodeImageJson(newImages);
      } else {
        print(response);
        throw Exception("Invalid Response");
      }
    }

    on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout) {
        throw Exception("Request timed out");
      } else {
        throw Exception("Request failed: $e");
      }
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

// Define a provider for Image Provider
final imageProvider = StateNotifierProvider<ImageProvider, ImageState>((ref) {
  return ImageProvider();
});
