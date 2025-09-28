import 'package:surf_mad_teacher_training/api/data/place_dto.dart';
import 'package:surf_mad_teacher_training/api/data/place_type_dto.dart';
import 'package:surf_mad_teacher_training/api/service/api_client.dart';
import 'package:surf_mad_teacher_training/core/data/repositories/base_repository.dart';
import 'package:surf_mad_teacher_training/core/domain/entities/result/request_operation.dart';
import 'package:surf_mad_teacher_training/feature/common/domain/entities/place_entity.dart';
import 'package:surf_mad_teacher_training/feature/filter/data/converters/filter_places_converter.dart';
import 'package:surf_mad_teacher_training/feature/filter/domain/entities/filter_places_entity.dart';
import 'package:surf_mad_teacher_training/feature/places/data/converters/place_response_converter.dart';
import 'package:surf_mad_teacher_training/feature/places/domain/repositories/i_places_repository.dart';

/// {@template places_repository.class}
/// Implementation of [IPlacesRepository].
/// {@endtemplate}
final class PlacesRepository extends BaseRepository implements IPlacesRepository {
  // ignore: unused_field
  final ApiClient _apiClient;
  final IFilterPlacesConverter _filterPlacesConverter;
  final IPlaceResponseConverter _placeResponseConverter;

  /// {@macro places_repository.class}
  const PlacesRepository({
    required ApiClient apiClient,
    required IFilterPlacesConverter filterPlacesConverter,
    required IPlaceResponseConverter placeResponseConverter,
  }) : _apiClient = apiClient,
       _filterPlacesConverter = filterPlacesConverter,
       _placeResponseConverter = placeResponseConverter;

  @override
  RequestOperation<List<PlaceEntity>> getPlaces({required FilterPlacesEntity filter}) => makeApiCall(() async {
    await Future.delayed(const Duration(milliseconds: 300));

    final placeDtos = List.generate(
      10,
      (index) => PlaceDto(
        id: index,
        name: 'Место $index',
        description: 'Описание места $index',
        placeType: index.isEven ? PlaceTypeDto.monument : PlaceTypeDto.hotel,
        images: ['https://picsum.photos/seed/1/1000/600?random=1'],
        lat: 33.33,
        lon: -33.33,
      ),
    );

    return _placeResponseConverter.convertMultiple(placeDtos).toList();
  });

  @override
  Future<FilterPlacesEntity> getSavedFilter() async {
    return FilterPlacesEntity();
  }
}
