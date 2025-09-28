part of '../../place_detail_screen.dart';

/// {@template _photo_viewing_indicator.class}
/// Индикатор просмотра фотографий.
/// {@endtemplate}
class _PhotoViewingIndicator extends StatelessWidget {
  final List<String> data;
  final int currentIndex;

  /// {@macro _photo_viewing_indicator.class}
  const _PhotoViewingIndicator({required this.data, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);

    return TodoPlaceholder(
      todo: 'Виджет индикатора просмотра фотографий.',
    );
  }
}
