import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm/features/home/model/posts.dart';
import 'package:mvvm/features/home/view/widgets/post_buttons.dart';
import 'package:mvvm/features/home/viewmodel/home_viewmodel.dart';
import 'package:mvvm/routing/app_router.gr.dart';
import 'package:mvvm/utils/app_fonts.dart';

class HomeTable extends ConsumerWidget {
  final List<Posts> posts;
  const HomeTable({super.key, required this.posts});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final urlProvider = ref.watch(launchUrlProvider);

    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${posts[index].id}'),
                SizedBox(height: 4),
                Text(posts[index].body, style: AppFont.bodyMedium14),
                SizedBox(height: 8),
                PostButtons(onDelete: () => posts[index], onTapUrl: () => urlProvider),
                Divider(),
              ],
            ),
          ),
          onTap: () => context.router.push(DetailsRoute(post: posts[index])),
        );
      },
    );
  }
}
