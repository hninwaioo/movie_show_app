// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of core;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TMDBGenres _$TMDBGenresFromJson(Map<String, dynamic> json) {
  return _TMDBGenresBasic.fromJson(json);
}

/// @nodoc
mixin _$TMDBGenres {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TMDBGenresCopyWith<TMDBGenres> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TMDBGenresCopyWith<$Res> {
  factory $TMDBGenresCopyWith(
          TMDBGenres value, $Res Function(TMDBGenres) then) =
      _$TMDBGenresCopyWithImpl<$Res, TMDBGenres>;
  @useResult
  $Res call({@JsonKey(name: 'name') String? name, int id});
}

/// @nodoc
class _$TMDBGenresCopyWithImpl<$Res, $Val extends TMDBGenres>
    implements $TMDBGenresCopyWith<$Res> {
  _$TMDBGenresCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TMDBGenresBasicCopyWith<$Res>
    implements $TMDBGenresCopyWith<$Res> {
  factory _$$_TMDBGenresBasicCopyWith(
          _$_TMDBGenresBasic value, $Res Function(_$_TMDBGenresBasic) then) =
      __$$_TMDBGenresBasicCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'name') String? name, int id});
}

/// @nodoc
class __$$_TMDBGenresBasicCopyWithImpl<$Res>
    extends _$TMDBGenresCopyWithImpl<$Res, _$_TMDBGenresBasic>
    implements _$$_TMDBGenresBasicCopyWith<$Res> {
  __$$_TMDBGenresBasicCopyWithImpl(
      _$_TMDBGenresBasic _value, $Res Function(_$_TMDBGenresBasic) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? id = null,
  }) {
    return _then(_$_TMDBGenresBasic(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TMDBGenresBasic implements _TMDBGenresBasic {
  _$_TMDBGenresBasic({@JsonKey(name: 'name') this.name, required this.id});

  factory _$_TMDBGenresBasic.fromJson(Map<String, dynamic> json) =>
      _$$_TMDBGenresBasicFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  final int id;

  @override
  String toString() {
    return 'TMDBGenres(name: $name, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TMDBGenresBasic &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TMDBGenresBasicCopyWith<_$_TMDBGenresBasic> get copyWith =>
      __$$_TMDBGenresBasicCopyWithImpl<_$_TMDBGenresBasic>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TMDBGenresBasicToJson(
      this,
    );
  }
}

abstract class _TMDBGenresBasic implements TMDBGenres {
  factory _TMDBGenresBasic(
      {@JsonKey(name: 'name') final String? name,
      required final int id}) = _$_TMDBGenresBasic;

  factory _TMDBGenresBasic.fromJson(Map<String, dynamic> json) =
      _$_TMDBGenresBasic.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_TMDBGenresBasicCopyWith<_$_TMDBGenresBasic> get copyWith =>
      throw _privateConstructorUsedError;
}
