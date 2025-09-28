import 'package:surf_mad_teacher_training/core/domain/entities/result/request_operation.dart';
import 'package:surf_mad_teacher_training/feature/common/domain/entities/place_entity.dart';

/// Интерфейс для фичи Список мест.
abstract interface class IPlacesRepository {
  /// Получение списка мест.
  RequestOperation<List<PlaceEntity>> getPlaces();
}
