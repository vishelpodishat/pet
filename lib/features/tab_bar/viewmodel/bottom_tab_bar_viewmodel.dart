import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm/features/tab_bar/model/tab_bar_model.dart';

class BottomTabBarViewmodel extends StateNotifier<int> {
  BottomTabBarViewmodel() : super(0);

  void updateSelectedTabIndex(int index) {
    state = index;
  }

  List<TabBarModel> get tabItems => [
    TabBarModel(icon: Icon(Icons.home), title: 'Home'),
    TabBarModel(icon: Icon(Icons.search), title: 'Search'),
    TabBarModel(icon: Icon(Icons.settings), title: 'Settings'),
  ];
}

final bottomNavProvider = StateNotifierProvider<BottomTabBarViewmodel, int>((ref) {
  return BottomTabBarViewmodel();
});
