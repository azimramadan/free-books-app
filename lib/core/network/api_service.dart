import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;

  static final String _apiKey = dotenv.env['GOOGLE_BOOKS_API_KEY'] ?? '';

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://www.googleapis.com/books/v1/volumes",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  ApiService._internal();

  Future<List<dynamic>> fetchBooks({
    required String query,
    bool freeOnly = false,
    bool paidOnly = false,
    String orderBy = "relevance",
  }) async {
    if (query.trim().isEmpty) {
      throw Exception("Search query cannot be empty.");
    }
    try {
      Map<String, dynamic> params = {
        "q": query,
        "maxResults": 40,
        "orderBy": orderBy,
        "printType": "books",
        "key": _apiKey,
      };

      if (freeOnly) params["filter"] = "free-ebooks";
      if (paidOnly) params["filter"] = "paid-ebooks";

      Response response = await dio.get("", queryParameters: params);
      return response.data["items"] ?? [];
    } on DioException catch (e) {
      throw Exception(_getDioErrorMessage(e));
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }

  Future<List<dynamic>> fetchBooksByIds(List<String> bookIds) async {
    List<dynamic> books = [];
    for (String id in bookIds) {
      try {
        Response response = await dio.get(
          "/$id",
          queryParameters: {"key": _apiKey},
        );
        books.add(response.data);
      } on DioException catch (e) {
        throw Exception(
          "Failed to load book ID: $id - ${_getDioErrorMessage(e)}",
        );
      } catch (e) {
        throw Exception(
          "An unexpected error occurred while loading book ID: $id",
        );
      }
    }
    return books;
  }

  String _getDioErrorMessage(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection to the server timed out.";
      case DioExceptionType.receiveTimeout:
        return "The server took too long to respond.";
      case DioExceptionType.badResponse:
        return "Server responded with an error (Code: ${e.response?.statusCode}).";
      case DioExceptionType.connectionError:
        return "No internet connection.";
      default:
        return "An unexpected error occurred while connecting to the server.";
    }
  }
}
