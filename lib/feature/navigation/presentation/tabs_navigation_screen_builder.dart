import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_mad_teacher_training/feature/navigation/di/tabs_navigation_dependencies.dart';
import 'package:surf_mad_teacher_training/feature/navigation/presentation/tabs_navigation_screen.dart';
import 'package:surf_mad_teacher_training/feature/navigation/presentation/tabs_navigation_wm.dart';

/// {@template tabs_navigation_screen_builder.class}
/// Виджет-обёртка для TabsNavigationScreen.
/// {@endtemplate}
class TabsNavigationScreenBuilder extends StatelessWidget {
  /// {@macro tabs_navigation_screen_builder.class}
  const TabsNavigationScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...TabsNavigationDependencies.providers(),
        Provider(create: (createContext) => TabsNavigationWM(context: createContext), dispose: (_, wm) => wm.dispose()),
      ],
      builder: (builderContext, _) => TabsNavigationScreen(wm: builderContext.read<TabsNavigationWM>()),
    );
  }
}
