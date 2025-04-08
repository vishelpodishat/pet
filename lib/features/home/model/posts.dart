import 'package:freezed_annotation/freezed_annotation.dart';

part 'posts.freezed.dart';

part 'posts.g.dart';

@freezed
abstract class Posts with _$Posts {
  const factory Posts({required int userId, required int id, required String title, required String body}) = _Posts;

  factory Posts.fromJson(Map<String, dynamic> json) => _$PostsFromJson(json);

  static Posts empty() => const Posts(userId: 0, id: 0, title: '', body: '');
}
