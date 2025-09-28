import 'package:flutter/material.dart';
import 'package:surf_mad_teacher_training/assets/images/app_svg_icons.dart';
import 'package:surf_mad_teacher_training/uikit/buttons/button_rounded.dart';
import 'package:surf_mad_teacher_training/uikit/themes/colors/app_color_theme.dart';

/// {@template back_button_widget.class}
/// Кнопка назад для аппбара.
/// {@endtemplate}
class BackButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;

  /// {@macro back_button_widget.class}
  const BackButtonWidget({this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);

    return ButtonRounded(
      size: 32,
      backgroundColor: colorTheme.scaffold,
      radius: 50,
      icon: AppSvgIcons.icArrow,
      iconColor: colorTheme.textSecondary,
      onPressed: onPressed ?? Navigator.of(context).pop,
    );
  }
}
