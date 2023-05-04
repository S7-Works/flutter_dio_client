// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'company_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CompanyData _$CompanyDataFromJson(Map<String, dynamic> json) {
  return _CompanyData.fromJson(json);
}

/// @nodoc
class _$CompanyDataTearOff {
  const _$CompanyDataTearOff();

  _CompanyData call({String name = '', String domain = '', String logo = ''}) {
    return _CompanyData(
      name: name,
      domain: domain,
      logo: logo,
    );
  }

  CompanyData fromJson(Map<String, Object?> json) {
    return CompanyData.fromJson(json);
  }
}

/// @nodoc
const $CompanyData = _$CompanyDataTearOff();

/// @nodoc
mixin _$CompanyData {
  String get name => throw _privateConstructorUsedError;
  String get domain => throw _privateConstructorUsedError;
  String get logo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompanyDataCopyWith<CompanyData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyDataCopyWith<$Res> {
  factory $CompanyDataCopyWith(
          CompanyData value, $Res Function(CompanyData) then) =
      _$CompanyDataCopyWithImpl<$Res>;
  $Res call({String name, String domain, String logo});
}

/// @nodoc
class _$CompanyDataCopyWithImpl<$Res> implements $CompanyDataCopyWith<$Res> {
  _$CompanyDataCopyWithImpl(this._value, this._then);

  final CompanyData _value;
  // ignore: unused_field
  final $Res Function(CompanyData) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? domain = freezed,
    Object? logo = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      domain: domain == freezed
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String,
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CompanyDataCopyWith<$Res>
    implements $CompanyDataCopyWith<$Res> {
  factory _$CompanyDataCopyWith(
          _CompanyData value, $Res Function(_CompanyData) then) =
      __$CompanyDataCopyWithImpl<$Res>;
  @override
  $Res call({String name, String domain, String logo});
}

/// @nodoc
class __$CompanyDataCopyWithImpl<$Res> extends _$CompanyDataCopyWithImpl<$Res>
    implements _$CompanyDataCopyWith<$Res> {
  __$CompanyDataCopyWithImpl(
      _CompanyData _value, $Res Function(_CompanyData) _then)
      : super(_value, (v) => _then(v as _CompanyData));

  @override
  _CompanyData get _value => super._value as _CompanyData;

  @override
  $Res call({
    Object? name = freezed,
    Object? domain = freezed,
    Object? logo = freezed,
  }) {
    return _then(_CompanyData(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      domain: domain == freezed
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String,
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CompanyData implements _CompanyData {
  const _$_CompanyData({this.name = '', this.domain = '', this.logo = ''});

  factory _$_CompanyData.fromJson(Map<String, dynamic> json) =>
      _$$_CompanyDataFromJson(json);

  @JsonKey()
  @override
  final String name;
  @JsonKey()
  @override
  final String domain;
  @JsonKey()
  @override
  final String logo;

  @override
  String toString() {
    return 'CompanyData(name: $name, domain: $domain, logo: $logo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CompanyData &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.domain, domain) &&
            const DeepCollectionEquality().equals(other.logo, logo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(domain),
      const DeepCollectionEquality().hash(logo));

  @JsonKey(ignore: true)
  @override
  _$CompanyDataCopyWith<_CompanyData> get copyWith =>
      __$CompanyDataCopyWithImpl<_CompanyData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompanyDataToJson(this);
  }
}

abstract class _CompanyData implements CompanyData {
  const factory _CompanyData({String name, String domain, String logo}) =
      _$_CompanyData;

  factory _CompanyData.fromJson(Map<String, dynamic> json) =
      _$_CompanyData.fromJson;

  @override
  String get name;
  @override
  String get domain;
  @override
  String get logo;
  @override
  @JsonKey(ignore: true)
  _$CompanyDataCopyWith<_CompanyData> get copyWith =>
      throw _privateConstructorUsedError;
}
