import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm/extension/theme_mode_extension.dart';
import 'package:mvvm/routing/app_router.dart';
import 'package:mvvm/theme/app_theme_mode.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeModeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: context.lightTheme,
      darkTheme: context.darkTheme,
      themeMode: themeMode.value,
      routerConfig: _appRouter.config(),
      builder: (context, child) => child!,
    );
  }
}
