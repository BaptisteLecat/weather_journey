// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Place _$PlaceFromJson(Map<String, dynamic> json) {
  return _Place.fromJson(json);
}

/// @nodoc
mixin _$Place {
// ignore: invalid_annotation_target
  @JsonKey(name: 'place_id')
  int get placeId =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'licence')
  String get licence =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'osm_type')
  String? get osmType =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'osm_id')
  int? get osmId =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'boundingbox')
  List<String> get boundingBox =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
  double get lat =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
  double get lon =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'display_name')
  String get displayName => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  double get importance => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  Map<String, String>? get address => throw _privateConstructorUsedError;
  Map<String, String>? get extraTags => throw _privateConstructorUsedError;
  Map<String, String>? get nameDetails => throw _privateConstructorUsedError;

  /// Serializes this Place to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceCopyWith<Place> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceCopyWith<$Res> {
  factory $PlaceCopyWith(Place value, $Res Function(Place) then) =
      _$PlaceCopyWithImpl<$Res, Place>;
  @useResult
  $Res call(
      {@JsonKey(name: 'place_id') int placeId,
      @JsonKey(name: 'licence') String licence,
      @JsonKey(name: 'osm_type') String? osmType,
      @JsonKey(name: 'osm_id') int? osmId,
      @JsonKey(name: 'boundingbox') List<String> boundingBox,
      @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
      double lat,
      @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
      double lon,
      @JsonKey(name: 'display_name') String displayName,
      String type,
      double importance,
      String? icon,
      Map<String, String>? address,
      Map<String, String>? extraTags,
      Map<String, String>? nameDetails});
}

/// @nodoc
class _$PlaceCopyWithImpl<$Res, $Val extends Place>
    implements $PlaceCopyWith<$Res> {
  _$PlaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? licence = null,
    Object? osmType = freezed,
    Object? osmId = freezed,
    Object? boundingBox = null,
    Object? lat = null,
    Object? lon = null,
    Object? displayName = null,
    Object? type = null,
    Object? importance = null,
    Object? icon = freezed,
    Object? address = freezed,
    Object? extraTags = freezed,
    Object? nameDetails = freezed,
  }) {
    return _then(_value.copyWith(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int,
      licence: null == licence
          ? _value.licence
          : licence // ignore: cast_nullable_to_non_nullable
              as String,
      osmType: freezed == osmType
          ? _value.osmType
          : osmType // ignore: cast_nullable_to_non_nullable
              as String?,
      osmId: freezed == osmId
          ? _value.osmId
          : osmId // ignore: cast_nullable_to_non_nullable
              as int?,
      boundingBox: null == boundingBox
          ? _value.boundingBox
          : boundingBox // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      importance: null == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as double,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      extraTags: freezed == extraTags
          ? _value.extraTags
          : extraTags // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      nameDetails: freezed == nameDetails
          ? _value.nameDetails
          : nameDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaceImplCopyWith<$Res> implements $PlaceCopyWith<$Res> {
  factory _$$PlaceImplCopyWith(
          _$PlaceImpl value, $Res Function(_$PlaceImpl) then) =
      __$$PlaceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'place_id') int placeId,
      @JsonKey(name: 'licence') String licence,
      @JsonKey(name: 'osm_type') String? osmType,
      @JsonKey(name: 'osm_id') int? osmId,
      @JsonKey(name: 'boundingbox') List<String> boundingBox,
      @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
      double lat,
      @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
      double lon,
      @JsonKey(name: 'display_name') String displayName,
      String type,
      double importance,
      String? icon,
      Map<String, String>? address,
      Map<String, String>? extraTags,
      Map<String, String>? nameDetails});
}

/// @nodoc
class __$$PlaceImplCopyWithImpl<$Res>
    extends _$PlaceCopyWithImpl<$Res, _$PlaceImpl>
    implements _$$PlaceImplCopyWith<$Res> {
  __$$PlaceImplCopyWithImpl(
      _$PlaceImpl _value, $Res Function(_$PlaceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? licence = null,
    Object? osmType = freezed,
    Object? osmId = freezed,
    Object? boundingBox = null,
    Object? lat = null,
    Object? lon = null,
    Object? displayName = null,
    Object? type = null,
    Object? importance = null,
    Object? icon = freezed,
    Object? address = freezed,
    Object? extraTags = freezed,
    Object? nameDetails = freezed,
  }) {
    return _then(_$PlaceImpl(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int,
      licence: null == licence
          ? _value.licence
          : licence // ignore: cast_nullable_to_non_nullable
              as String,
      osmType: freezed == osmType
          ? _value.osmType
          : osmType // ignore: cast_nullable_to_non_nullable
              as String?,
      osmId: freezed == osmId
          ? _value.osmId
          : osmId // ignore: cast_nullable_to_non_nullable
              as int?,
      boundingBox: null == boundingBox
          ? _value._boundingBox
          : boundingBox // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      importance: null == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as double,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value._address
          : address // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      extraTags: freezed == extraTags
          ? _value._extraTags
          : extraTags // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      nameDetails: freezed == nameDetails
          ? _value._nameDetails
          : nameDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PlaceImpl implements _Place {
  const _$PlaceImpl(
      {@JsonKey(name: 'place_id') required this.placeId,
      @JsonKey(name: 'licence') required this.licence,
      @JsonKey(name: 'osm_type') this.osmType,
      @JsonKey(name: 'osm_id') this.osmId,
      @JsonKey(name: 'boundingbox') required final List<String> boundingBox,
      @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
      required this.lat,
      @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
      required this.lon,
      @JsonKey(name: 'display_name') required this.displayName,
      required this.type,
      required this.importance,
      this.icon,
      final Map<String, String>? address,
      final Map<String, String>? extraTags,
      final Map<String, String>? nameDetails})
      : _boundingBox = boundingBox,
        _address = address,
        _extraTags = extraTags,
        _nameDetails = nameDetails;

  factory _$PlaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'place_id')
  final int placeId;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'licence')
  final String licence;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'osm_type')
  final String? osmType;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'osm_id')
  final int? osmId;
// ignore: invalid_annotation_target
  final List<String> _boundingBox;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'boundingbox')
  List<String> get boundingBox {
    if (_boundingBox is EqualUnmodifiableListView) return _boundingBox;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_boundingBox);
  }

// ignore: invalid_annotation_target
  @override
  @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
  final double lat;
// ignore: invalid_annotation_target
  @override
  @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
  final double lon;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'display_name')
  final String displayName;
  @override
  final String type;
  @override
  final double importance;
  @override
  final String? icon;
  final Map<String, String>? _address;
  @override
  Map<String, String>? get address {
    final value = _address;
    if (value == null) return null;
    if (_address is EqualUnmodifiableMapView) return _address;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, String>? _extraTags;
  @override
  Map<String, String>? get extraTags {
    final value = _extraTags;
    if (value == null) return null;
    if (_extraTags is EqualUnmodifiableMapView) return _extraTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, String>? _nameDetails;
  @override
  Map<String, String>? get nameDetails {
    final value = _nameDetails;
    if (value == null) return null;
    if (_nameDetails is EqualUnmodifiableMapView) return _nameDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Place(placeId: $placeId, licence: $licence, osmType: $osmType, osmId: $osmId, boundingBox: $boundingBox, lat: $lat, lon: $lon, displayName: $displayName, type: $type, importance: $importance, icon: $icon, address: $address, extraTags: $extraTags, nameDetails: $nameDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceImpl &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.licence, licence) || other.licence == licence) &&
            (identical(other.osmType, osmType) || other.osmType == osmType) &&
            (identical(other.osmId, osmId) || other.osmId == osmId) &&
            const DeepCollectionEquality()
                .equals(other._boundingBox, _boundingBox) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.importance, importance) ||
                other.importance == importance) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            const DeepCollectionEquality().equals(other._address, _address) &&
            const DeepCollectionEquality()
                .equals(other._extraTags, _extraTags) &&
            const DeepCollectionEquality()
                .equals(other._nameDetails, _nameDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      placeId,
      licence,
      osmType,
      osmId,
      const DeepCollectionEquality().hash(_boundingBox),
      lat,
      lon,
      displayName,
      type,
      importance,
      icon,
      const DeepCollectionEquality().hash(_address),
      const DeepCollectionEquality().hash(_extraTags),
      const DeepCollectionEquality().hash(_nameDetails));

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceImplCopyWith<_$PlaceImpl> get copyWith =>
      __$$PlaceImplCopyWithImpl<_$PlaceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceImplToJson(
      this,
    );
  }
}

abstract class _Place implements Place {
  const factory _Place(
      {@JsonKey(name: 'place_id') required final int placeId,
      @JsonKey(name: 'licence') required final String licence,
      @JsonKey(name: 'osm_type') final String? osmType,
      @JsonKey(name: 'osm_id') final int? osmId,
      @JsonKey(name: 'boundingbox') required final List<String> boundingBox,
      @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
      required final double lat,
      @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
      required final double lon,
      @JsonKey(name: 'display_name') required final String displayName,
      required final String type,
      required final double importance,
      final String? icon,
      final Map<String, String>? address,
      final Map<String, String>? extraTags,
      final Map<String, String>? nameDetails}) = _$PlaceImpl;

  factory _Place.fromJson(Map<String, dynamic> json) = _$PlaceImpl.fromJson;

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'place_id')
  int get placeId; // ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'licence')
  String get licence; // ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'osm_type')
  String? get osmType; // ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'osm_id')
  int? get osmId; // ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'boundingbox')
  List<String> get boundingBox; // ignore: invalid_annotation_target
  @override
  @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
  double get lat; // ignore: invalid_annotation_target
  @override
  @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
  double get lon; // ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'display_name')
  String get displayName;
  @override
  String get type;
  @override
  double get importance;
  @override
  String? get icon;
  @override
  Map<String, String>? get address;
  @override
  Map<String, String>? get extraTags;
  @override
  Map<String, String>? get nameDetails;

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceImplCopyWith<_$PlaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
