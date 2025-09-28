import 'package:flutter/material.dart';
import 'package:surf_mad_teacher_training/feature/navigation/presentation/tabs_navigation_wm.dart';
import 'package:surf_mad_teacher_training/feature/navigation/presentation/widgets/bottom_navigation_bar_widget.dart';

/// {@template tabs_navigation_screen.dart}
/// Экран приложения, отвечающий за навигацию.
///
/// Выводит нижнюю панель навигации и текущий выбранный экран.
/// {@endtemplate}
class TabsNavigationScreen extends StatelessWidget {
  final ITabsNavigationWM wm;

  /// {@macro tabs_navigation_screen.dart}
  const TabsNavigationScreen({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWidget(wm: wm),
      body: ValueListenableBuilder(
        valueListenable: wm.currentTabIndex,
        builder: (_, currentTabIndex, __) {
          return wm.tabRoutes[currentTabIndex];
        },
      ),
    );
  }
}
