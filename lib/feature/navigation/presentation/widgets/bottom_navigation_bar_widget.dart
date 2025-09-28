import 'package:flutter/material.dart';
import 'package:surf_mad_teacher_training/assets/images/app_svg_icons.dart';
import 'package:surf_mad_teacher_training/feature/navigation/presentation/tabs_navigation_wm.dart';
import 'package:surf_mad_teacher_training/uikit/images/svg_picture_widget.dart';
import 'package:surf_mad_teacher_training/uikit/themes/colors/app_color_theme.dart';

/// {@template bottom_navigation_bar_widget.dart}
/// Виджет нижней панели навигации.
/// {@endtemplate}
class BottomNavigationBarWidget extends StatelessWidget {
  final ITabsNavigationWM wm;

  /// {@macro bottom_navigation_bar_widget.dart}
  const BottomNavigationBarWidget({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(border: Border(top: BorderSide(color: colorTheme.inactive))),
      position: DecorationPosition.foreground,
      child: ValueListenableBuilder(
        valueListenable: wm.currentTabIndex,
        builder: (_, currentTabIndex, __) {
          return BottomNavigationBar(
            items: [
              _BottomNavigationBarItem(
                iconPath: AppSvgIcons.icList,
                label: 'Места',
                selectedIconPath: AppSvgIcons.icListFull,
                iconColor: colorTheme.bottomNavigationBarIcon,
                activeIconColor: colorTheme.bottomNavigationBarActiveIcon,
              ),
              _BottomNavigationBarItem(
                iconPath: AppSvgIcons.icHeart,
                label: 'Избранное',
                selectedIconPath: AppSvgIcons.icHeartFull,
                iconColor: colorTheme.bottomNavigationBarIcon,
                activeIconColor: colorTheme.bottomNavigationBarActiveIcon,
              ),
              _BottomNavigationBarItem(
                iconPath: AppSvgIcons.icSettings,
                label: 'Настройки',
                selectedIconPath: AppSvgIcons.icSettingsFull,
                iconColor: colorTheme.bottomNavigationBarIcon,
                activeIconColor: colorTheme.bottomNavigationBarActiveIcon,
              ),
            ],
            onTap: wm.onTabTapped,
            currentIndex: currentTabIndex,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: colorTheme.scaffold,
            showSelectedLabels: false,
            showUnselectedLabels: false,
          );
        },
      ),
    );
  }
}

class _BottomNavigationBarItem extends BottomNavigationBarItem {
  _BottomNavigationBarItem({
    required String iconPath,
    required String label,
    required String selectedIconPath,
    Color? iconColor,
    Color? activeIconColor,
  }) : super(
         icon: SvgPictureWidget(iconPath, color: iconColor, width: 24, height: 24),
         label: label,
         activeIcon: SvgPictureWidget(selectedIconPath, color: activeIconColor, width: 24, height: 24),
       );
}
