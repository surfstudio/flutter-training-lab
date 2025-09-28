import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:surf_mad_teacher_training/feature/index/index_screen.dart';
import 'package:surf_mad_teacher_training/uikit/placeholder/todo_placeholder.dart';

abstract interface class ITabsNavigationWM {
  /// Список разделов приложения, которые будут переключаться с помощью нижней панели навигации.
  List<Widget> get tabRoutes;

  /// Индекс текущего отображаемого экрана.
  ValueListenable<int> get currentTabIndex;

  /// Очищает ресурсы перед удалением виджет модели.
  void dispose();

  /// Обрабатывает нажатие на кнопку нижней панели навигации.
  void onTabTapped(int routeIndex);
}

final class TabsNavigationWM implements ITabsNavigationWM {
  // ignore: unused_field
  final BuildContext _context;

  @override
  final ValueNotifier<int> currentTabIndex = ValueNotifier(0);

  TabsNavigationWM({required BuildContext context}) : _context = context;

  @override
  List<Widget> get tabRoutes => const [
    IndexScreen(),
    SafeArea(child: TodoPlaceholder(todo: 'Подключите экран "Избранные места"')),
    SafeArea(child: TodoPlaceholder(todo: 'Подключите экран "Настройки"')),
  ];

  @override
  // ignore: no-empty-block
  void dispose() {}

  @override
  Future<void> onTabTapped(int routeIndex) async {
    currentTabIndex.value = routeIndex;
  }
}
