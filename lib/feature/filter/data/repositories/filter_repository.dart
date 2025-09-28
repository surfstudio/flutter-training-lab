import 'package:surf_mad_teacher_training/api/service/api_client.dart';
import 'package:surf_mad_teacher_training/core/data/repositories/base_repository.dart';
import 'package:surf_mad_teacher_training/core/domain/entities/result/request_operation.dart';
import 'package:surf_mad_teacher_training/feature/filter/domain/repositories/i_filter_repository.dart';

/// {@template filter_repository.class}
/// Implementation of [IFilterRepository].
/// {@endtemplate}
final class FilterRepository extends BaseRepository implements IFilterRepository {
  final ApiClient _apiClient;

  /// {@macro filter_repository.class}
  const FilterRepository({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  // TODO(lab4): реализовать фильтрацию по запросу.
  @override
  RequestOperation<int> getPlaces() => makeApiCall(() async {
    final data = await _apiClient.getPlaces();

    return data.length;
  });
}
