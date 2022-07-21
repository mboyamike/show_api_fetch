import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:showing_api_fetch/models/models.dart';

abstract class _Endpoints {
  static const baseURL = 'https://jsonplaceholder.typicode.com';
  static const posts = '$baseURL/posts';
  static const comments = '$baseURL/comments';
}

class Repository {
  Repository({required this.client});

  final http.Client client;

  Future<List<Post>> fetchPosts() async {
    try {
      final result = await client.get(Uri.parse(_Endpoints.posts));
      final List json = jsonDecode(result.body);
      final posts = json.map((e) => Post.fromMap(Map<String, dynamic>.from(e)));
      return posts.toList();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<List<Comment>> fetchComments() async {
    try {
      final result = await client.get(Uri.parse(_Endpoints.comments));
      final List json = jsonDecode(result.body);
      final comments = json.map((e) => Comment.fromMap(Map<String, dynamic>.from(e)));
      return comments.toList();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
