part of '../../place_detail_screen.dart';

/// {@template _photo_slider_widget.class}
/// Виджет фотогалереи для подробности места.
/// {@endtemplate}
class _PhotoSliderWidget extends StatelessWidget {
  final PageController pageController;
  final List<String> images;
  final VoidCallback onBackPressed;
  final ValueListenable<int> currentIndex;
  final ValueChanged<int> onPageChanged;

  /// {@macro _photo_slider_widget}
  const _PhotoSliderWidget({
    required this.images,
    required this.pageController,
    required this.onBackPressed,
    required this.currentIndex,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);

    return TodoPlaceholder(
      todo: 'Виджет фотогалереи для подробности места.',
    );
  }
}
