import 'package:surf_mad_teacher_training/core/domain/entities/result/request_operation.dart';

/// Интерфейс для репозитория для Фильтра.
abstract interface class IFilterRepository {
  // TOOD(lab4): реализовать фильтрацию по запросу.
  /// Получение количества найденных мест.
  RequestOperation<int> getPlaces();
}
