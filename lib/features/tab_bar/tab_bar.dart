import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm/features/home/view/home_page.dart';
import 'package:mvvm/features/search/search_page.dart';
import 'package:mvvm/features/settings/settings_page.dart';
import 'package:mvvm/features/tab_bar/viewmodel/bottom_tab_bar_viewmodel.dart';
import 'package:mvvm/routing/app_router.gr.dart';

@RoutePage()
class TabBar extends ConsumerWidget {
  const TabBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(bottomNavProvider);
    final viewModel = ref.read(bottomNavProvider.notifier);

    final List<Widget> pages = [HomePage(), SearchPage(), SettingsPage()];

    return AutoTabsRouter.pageView(
      routes: [HomeRoute(), SettingsRoute()],
      builder: (context, child, _) {
        return Scaffold(
          body: pages[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              viewModel.updateSelectedTabIndex(index);
            },
            type: BottomNavigationBarType.fixed,
            items: viewModel.tabItems.map((item) => BottomNavigationBarItem(icon: item.icon, label: item.title)).toList(),
          ),
        );
      },
    );
  }
}
