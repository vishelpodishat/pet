import 'package:mvvm/features/home/model/posts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mvvm/features/home/repository/posts_repository.dart';

part 'home_viewmodel.g.dart';

@riverpod
Future<List<Posts>> posts(Ref ref) async {
  final repository = ref.watch(postsRepositoryProvider);
  return repository.getPosts();
}

@riverpod
Future<void> launchUrl(Ref ref) async {
  final repository = ref.watch(postsRepositoryProvider);
  return repository.getUrlLaunch();
}
