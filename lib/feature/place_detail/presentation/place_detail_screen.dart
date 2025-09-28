import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:surf_mad_teacher_training/feature/common/domain/entities/place_entity.dart';
import 'package:surf_mad_teacher_training/feature/place_detail/presentation/place_detail_wm.dart';
import 'package:surf_mad_teacher_training/uikit/placeholder/todo_placeholder.dart';
import 'package:surf_mad_teacher_training/uikit/themes/colors/app_color_theme.dart';
import 'package:surf_mad_teacher_training/uikit/themes/text/app_text_theme.dart';

part 'widgets/_place_details_content.dart';
part 'widgets/slider/_photo_slider_widget.dart';
part 'widgets/slider/_photo_viewing_indicator.dart';

/// {@template place_detail_screen.class}
/// Экран подробностей о месте.
/// {@endtemplate}
class PlaceDetailScreen extends StatelessWidget {
  final IPlaceDetailWM wm;
  final PlaceEntity place;

  /// {@macro place_detail_screen.class}
  const PlaceDetailScreen({required this.wm, required this.place, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Детальный экран места'), iconTheme: IconThemeData(color: Colors.black)),
      body: Column(
        children: [
          // TODO(any): перейдите в _PhotoSliderWidget и реализуйте в соответствии с дизайном.
          // TODO(any): перейдите в _PhotoViewingIndicator и реализуйте в соответствии с дизайном.
          TodoPlaceholder(
            todo:
                'Виджет для отображения фотографий в соответствии с дизайном. Данные для экрана возьмите из PlaceEntity.',
            height: 200,
          ),
          // TODO(any): перейдите в _PlaceDetailsContent и реализуйте в соответствии с дизайном.
          TodoPlaceholder(
            todo:
                'Виджет для отображения описания. Данные для экрана возьмите из PlaceEntity. Используйте _PlaceDetailsContent',
          ),
          TodoPlaceholder(todo: 'Виджет для отображения кнопки "Избранное".'),
        ],
      ),
    );
  }
}
