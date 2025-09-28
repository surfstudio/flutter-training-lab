part of '../place_detail_screen.dart';

/// {@template _place_details_content.class}
/// Основной текстовый контент для детальной страницы.
/// {@endtemplate}
class _PlaceDetailsContent extends StatelessWidget {
  final PlaceEntity place;

  /// {@macro _place_details_content.class}
  const _PlaceDetailsContent({required this.place});

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return TodoPlaceholder(
      todo: 'Виджет для отображения описания места. Данные возьмите из PlaceEntity.',
    );
  }
}
