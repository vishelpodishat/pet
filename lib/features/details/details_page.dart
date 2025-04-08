import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/features/home/model/posts.dart';
import 'package:mvvm/utils/app_fonts.dart';

@RoutePage()
class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.post});

  final Posts post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${post.id}', style: AppFont.bodyExtraLarge18),
            SizedBox(height: 8),
            Text(post.title, style: AppFont.bodyHuge20),
            SizedBox(height: 16),
            Text(post.body, style: AppFont.bodyHuge20),
          ],
        ),
      ),
    );
  }
}
