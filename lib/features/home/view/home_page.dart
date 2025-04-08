import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm/features/home/view/widgets/home_table.dart';
import 'package:mvvm/features/home/viewmodel/home_viewmodel.dart';
import 'package:mvvm/theme/app_theme_mode.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(appThemeModeProvider);
    final postsAsync = ref.watch(postsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('MVVM'),
        actions: [
          IconButton(
            onPressed: () => ref.read(appThemeModeProvider.notifier).toggleTheme(),
            icon: Icon(themeState.value == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      body: postsAsync.when(
        data: (posts) => HomeTable(posts: posts),
        error: (error, stackTrace) => Center(child: Text('Error: ${error.toString()}')),
        loading: () => Center(child: (CircularProgressIndicator())),
      ),
    );
  }
}
