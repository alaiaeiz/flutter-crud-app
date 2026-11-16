import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/post.dart';

/// Exception khusus supaya UI bisa menampilkan pesan yang rapi.
class ApiException implements Exception {
  final String message;
  const ApiException(this.message);

  @override
  String toString() => message;
}

class PostService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';
  static const Duration _timeout = Duration(seconds: 10);
  static const Map<String, String> _headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  // READ - GET /posts
  Future<List<Post>> getPosts() async {
    try {
      final response = await http
          .get(Uri.parse('$_baseUrl/posts'))
          .timeout(_timeout);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data
            .map((item) => Post.fromJson(item as Map<String, dynamic>))
            .toList();
      }
      throw ApiException('Gagal memuat data (kode ${response.statusCode})');
    } on ApiException {
      rethrow;
    } catch (_) {
      throw const ApiException(
        'Tidak dapat terhubung ke server. Periksa koneksi internetmu.',
      );
    }
  }

  // CREATE - POST /posts
  Future<Post> createPost({
    required String title,
    required String body,
  }) async {
    try {
      final response = await http
          .post(
            Uri.parse('$_baseUrl/posts'),
            headers: _headers,
            body: jsonEncode({'userId': 1, 'title': title, 'body': body}),
          )
          .timeout(_timeout);

      if (response.statusCode == 201) {
        return Post.fromJson(jsonDecode(response.body));
      }
      throw ApiException('Gagal menambah data (kode ${response.statusCode})');
    } on ApiException {
      rethrow;
    } catch (_) {
      throw const ApiException(
        'Tidak dapat terhubung ke server. Periksa koneksi internetmu.',
      );
    }
  }

  // UPDATE - PUT /posts/{id}
  Future<Post> updatePost(Post post) async {
    try {
      final response = await http
          .put(
            Uri.parse('$_baseUrl/posts/${post.id}'),
            headers: _headers,
            body: jsonEncode(post.toJson()),
          )
          .timeout(_timeout);

      if (response.statusCode == 200) {
        return Post.fromJson(jsonDecode(response.body));
      }
      throw ApiException('Gagal mengubah data (kode ${response.statusCode})');
    } on ApiException {
      rethrow;
    } catch (_) {
      throw const ApiException(
        'Tidak dapat terhubung ke server. Periksa koneksi internetmu.',
      );
    }
  }

  // DELETE - DELETE /posts/{id}
  Future<void> deletePost(int id) async {
    try {
      final response = await http
          .delete(Uri.parse('$_baseUrl/posts/$id'))
          .timeout(_timeout);

      if (response.statusCode != 200) {
        throw ApiException(
          'Gagal menghapus data (kode ${response.statusCode})',
        );
      }
    } on ApiException {
      rethrow;
    } catch (_) {
      throw const ApiException(
        'Tidak dapat terhubung ke server. Periksa koneksi internetmu.',
      );
    }
  }
}