import 'package:flutter/material.dart';
import 'package:showing_api_fetch/repositories/repository.dart';

import '../models/models.dart';

class AppProvider extends ChangeNotifier {
  AppProvider({required this.repository});

  final Repository repository;

  List<Comment> comments = [];
  List<Post> posts = [];

  bool isLoading = false;
  String? error;

  Future<void> fetchPosts() async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      posts = await repository.fetchPosts();
    } catch (e) {
      error = e.toString();
    }
    notifyListeners();
  }

  Future<void> fetchComments() async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      comments = await repository.fetchComments();
    } catch (e) {
      error = e.toString();
    }
    notifyListeners();
  }
}
