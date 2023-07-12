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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Place _$PlaceFromJson(Map<String, dynamic> json) {
  return _Place.fromJson(json);
}

/// @nodoc
mixin _$Place {
  @JsonKey(name: 'place_id')
  int get placeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'licence')
  String get licence => throw _privateConstructorUsedError;
  @JsonKey(name: 'osm_type')
  String? get osmType => throw _privateConstructorUsedError;
  @JsonKey(name: 'osm_id')
  int? get osmId => throw _privateConstructorUsedError;
  @JsonKey(name: 'boundingbox')
  List<String> get boundingBox => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
  double get lat => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
  double get lon => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_name')
  String get displayName => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  double get importance => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  Map<String, String>? get address => throw _privateConstructorUsedError;
  Map<String, String>? get extraTags => throw _privateConstructorUsedError;
  Map<String, String>? get nameDetails => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceCopyWith<Place> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceCopyWith<$Res> {
  factory $PlaceCopyWith(Place value, $Res Function(Place) then) =
      _$PlaceCopyWithImpl<$Res, Place>;
  @useResult
  $Res call(
      {@JsonKey(name: 'place_id')
          int placeId,
      @JsonKey(name: 'licence')
          String licence,
      @JsonKey(name: 'osm_type')
          String? osmType,
      @JsonKey(name: 'osm_id')
          int? osmId,
      @JsonKey(name: 'boundingbox')
          List<String> boundingBox,
      @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
          double lat,
      @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
          double lon,
      @JsonKey(name: 'display_name')
          String displayName,
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
abstract class _$$_PlaceCopyWith<$Res> implements $PlaceCopyWith<$Res> {
  factory _$$_PlaceCopyWith(_$_Place value, $Res Function(_$_Place) then) =
      __$$_PlaceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'place_id')
          int placeId,
      @JsonKey(name: 'licence')
          String licence,
      @JsonKey(name: 'osm_type')
          String? osmType,
      @JsonKey(name: 'osm_id')
          int? osmId,
      @JsonKey(name: 'boundingbox')
          List<String> boundingBox,
      @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
          double lat,
      @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
          double lon,
      @JsonKey(name: 'display_name')
          String displayName,
      String type,
      double importance,
      String? icon,
      Map<String, String>? address,
      Map<String, String>? extraTags,
      Map<String, String>? nameDetails});
}

/// @nodoc
class __$$_PlaceCopyWithImpl<$Res> extends _$PlaceCopyWithImpl<$Res, _$_Place>
    implements _$$_PlaceCopyWith<$Res> {
  __$$_PlaceCopyWithImpl(_$_Place _value, $Res Function(_$_Place) _then)
      : super(_value, _then);

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
    return _then(_$_Place(
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
class _$_Place implements _Place {
  const _$_Place(
      {@JsonKey(name: 'place_id')
          required this.placeId,
      @JsonKey(name: 'licence')
          required this.licence,
      @JsonKey(name: 'osm_type')
          this.osmType,
      @JsonKey(name: 'osm_id')
          this.osmId,
      @JsonKey(name: 'boundingbox')
          required final List<String> boundingBox,
      @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
          required this.lat,
      @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
          required this.lon,
      @JsonKey(name: 'display_name')
          required this.displayName,
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

  factory _$_Place.fromJson(Map<String, dynamic> json) =>
      _$$_PlaceFromJson(json);

  @override
  @JsonKey(name: 'place_id')
  final int placeId;
  @override
  @JsonKey(name: 'licence')
  final String licence;
  @override
  @JsonKey(name: 'osm_type')
  final String? osmType;
  @override
  @JsonKey(name: 'osm_id')
  final int? osmId;
  final List<String> _boundingBox;
  @override
  @JsonKey(name: 'boundingbox')
  List<String> get boundingBox {
    if (_boundingBox is EqualUnmodifiableListView) return _boundingBox;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_boundingBox);
  }

  @override
  @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
  final double lat;
  @override
  @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
  final double lon;
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Place &&
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlaceCopyWith<_$_Place> get copyWith =>
      __$$_PlaceCopyWithImpl<_$_Place>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlaceToJson(
      this,
    );
  }
}

abstract class _Place implements Place {
  const factory _Place(
      {@JsonKey(name: 'place_id')
          required final int placeId,
      @JsonKey(name: 'licence')
          required final String licence,
      @JsonKey(name: 'osm_type')
          final String? osmType,
      @JsonKey(name: 'osm_id')
          final int? osmId,
      @JsonKey(name: 'boundingbox')
          required final List<String> boundingBox,
      @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
          required final double lat,
      @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
          required final double lon,
      @JsonKey(name: 'display_name')
          required final String displayName,
      required final String type,
      required final double importance,
      final String? icon,
      final Map<String, String>? address,
      final Map<String, String>? extraTags,
      final Map<String, String>? nameDetails}) = _$_Place;

  factory _Place.fromJson(Map<String, dynamic> json) = _$_Place.fromJson;

  @override
  @JsonKey(name: 'place_id')
  int get placeId;
  @override
  @JsonKey(name: 'licence')
  String get licence;
  @override
  @JsonKey(name: 'osm_type')
  String? get osmType;
  @override
  @JsonKey(name: 'osm_id')
  int? get osmId;
  @override
  @JsonKey(name: 'boundingbox')
  List<String> get boundingBox;
  @override
  @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
  double get lat;
  @override
  @JsonKey(fromJson: _coordinatesFromJson, toJson: _coordinatesToJson)
  double get lon;
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
  @override
  @JsonKey(ignore: true)
  _$$_PlaceCopyWith<_$_Place> get copyWith =>
      throw _privateConstructorUsedError;
}
