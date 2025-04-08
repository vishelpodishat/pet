import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm/core/api/api_service.dart';
import 'package:mvvm/features/home/model/posts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'posts_repository.g.dart';

@riverpod
PostsRepository postsRepository(Ref ref) {
  return PostsRepository(ApiService());
}

class PostsRepository {
  final ApiService _apiService;

  PostsRepository(this._apiService);

  Future<List<Posts>> getPosts() async {
    try {
      return await _apiService.get<List<Posts>>(
        endpoint: '/posts',
        parser: (data) {
          final List<dynamic> userList = data as List<dynamic>;
          return userList.map((json) => Posts.fromJson(json)).toList();
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching users: $e');
      }
      rethrow;
    }
  }

  Future<void> getUrlLaunch() async {
    await Uri.parse('https://flutter.dev');
  }
}
