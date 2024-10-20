import 'package:dio/dio.dart';

class ImageManager{
  Future<List<dynamic>> fetchImages(int page, int limit) async {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        sendTimeout: const Duration(seconds: 8)
      ),
    );

    try {
      final response = await dio.get(
        'https://picsum.photos/v2/list',
        queryParameters: {
          'page': page,
          'limit': limit,
        },
      );

      if (response.statusCode == 200) {
        return response.data;
      }
      else {
        print(response);
        throw Exception('Invalid Response');
      }
    }
    on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout) {
        throw Exception("Request timed out");
      }
      else {
        throw Exception("Request failed: $e");
      }
    }
  }
}