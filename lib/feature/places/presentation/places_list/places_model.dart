import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:surf_mad_teacher_training/core/domain/entities/result/result.dart';
import 'package:surf_mad_teacher_training/feature/common/domain/entities/place_type.dart';
import 'package:surf_mad_teacher_training/feature/filter/domain/entities/filter_places_entity.dart';
import 'package:surf_mad_teacher_training/feature/places/domain/entities/places_state.dart';
import 'package:surf_mad_teacher_training/feature/places/domain/repositories/i_places_repository.dart';

/// {@template places_model.class}
/// Модель для PlacesScreen.
/// {@endtemplate}
final class PlacesModel implements IPlacesModel {
  final IPlacesRepository _placesRepository;
  final _placesState = ValueNotifier<PlacesState>(PlacesStateLoading());

  /// {@macro places_model.class}
  PlacesModel({required IPlacesRepository placesRepository}) : _placesRepository = placesRepository;

  @override
  ValueListenable<PlacesState> get placesStateListenable => _placesState;

  @override
  void dispose() {
    _placesState.dispose();
  }

  @override
  Future<FilterPlacesEntity> getSavedFilter() async {
    /// Моковый фильтр.
    return FilterPlacesEntity(
      lat: 55.754194,
      lon: 37.620139,
      radius: 3000,
      type: PlaceType.values.toSet(),
      name: 'Москва',
    );
  }

  @override
  Future<void> getPlaces({required FilterPlacesEntity filter}) async {
    _placesState.value = PlacesStateLoading();
    // TODO: реализовать фильтрацию по запросу.
    final result = await _placesRepository.getPlaces();

    switch (result) {
      case ResultOk(:final data):
        _placesState.value = PlacesStateData(data);
      case ResultFailed(:final error):
        _placesState.value = PlacesStateFailure(error);
    }
  }
}

abstract interface class IPlacesModel {
  ValueListenable<PlacesState> get placesStateListenable;

  void dispose();

  Future<FilterPlacesEntity> getSavedFilter();

  Future<void> getPlaces({required FilterPlacesEntity filter});
}
