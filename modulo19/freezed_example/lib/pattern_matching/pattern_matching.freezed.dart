// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pattern_matching.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Union {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int value) $default, {
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(int value)? $default, {
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int value)? $default, {
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(UnionData value) $default, {
    required TResult Function(UnionLoading value) loading,
    required TResult Function(UnionError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(UnionData value)? $default, {
    TResult Function(UnionLoading value)? loading,
    TResult Function(UnionError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(UnionData value)? $default, {
    TResult Function(UnionLoading value)? loading,
    TResult Function(UnionError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnionCopyWith<$Res> {
  factory $UnionCopyWith(Union value, $Res Function(Union) then) =
      _$UnionCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnionCopyWithImpl<$Res> implements $UnionCopyWith<$Res> {
  _$UnionCopyWithImpl(this._value, this._then);

  final Union _value;
  // ignore: unused_field
  final $Res Function(Union) _then;
}

/// @nodoc
abstract class $UnionDataCopyWith<$Res> {
  factory $UnionDataCopyWith(UnionData value, $Res Function(UnionData) then) =
      _$UnionDataCopyWithImpl<$Res>;
  $Res call({int value});
}

/// @nodoc
class _$UnionDataCopyWithImpl<$Res> extends _$UnionCopyWithImpl<$Res>
    implements $UnionDataCopyWith<$Res> {
  _$UnionDataCopyWithImpl(UnionData _value, $Res Function(UnionData) _then)
      : super(_value, (v) => _then(v as UnionData));

  @override
  UnionData get _value => super._value as UnionData;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(UnionData(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UnionData implements UnionData {
  _$UnionData(this.value);

  @override
  final int value;

  @override
  String toString() {
    return 'Union(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnionData &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  $UnionDataCopyWith<UnionData> get copyWith =>
      _$UnionDataCopyWithImpl<UnionData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int value) $default, {
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return $default(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(int value)? $default, {
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return $default?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int value)? $default, {
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(UnionData value) $default, {
    required TResult Function(UnionLoading value) loading,
    required TResult Function(UnionError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(UnionData value)? $default, {
    TResult Function(UnionLoading value)? loading,
    TResult Function(UnionError value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(UnionData value)? $default, {
    TResult Function(UnionLoading value)? loading,
    TResult Function(UnionError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class UnionData implements Union {
  factory UnionData(final int value) = _$UnionData;

  int get value => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnionDataCopyWith<UnionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnionLoadingCopyWith<$Res> {
  factory $UnionLoadingCopyWith(
          UnionLoading value, $Res Function(UnionLoading) then) =
      _$UnionLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnionLoadingCopyWithImpl<$Res> extends _$UnionCopyWithImpl<$Res>
    implements $UnionLoadingCopyWith<$Res> {
  _$UnionLoadingCopyWithImpl(
      UnionLoading _value, $Res Function(UnionLoading) _then)
      : super(_value, (v) => _then(v as UnionLoading));

  @override
  UnionLoading get _value => super._value as UnionLoading;
}

/// @nodoc

class _$UnionLoading implements UnionLoading {
  _$UnionLoading();

  @override
  String toString() {
    return 'Union.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UnionLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int value) $default, {
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(int value)? $default, {
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int value)? $default, {
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(UnionData value) $default, {
    required TResult Function(UnionLoading value) loading,
    required TResult Function(UnionError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(UnionData value)? $default, {
    TResult Function(UnionLoading value)? loading,
    TResult Function(UnionError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(UnionData value)? $default, {
    TResult Function(UnionLoading value)? loading,
    TResult Function(UnionError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class UnionLoading implements Union {
  factory UnionLoading() = _$UnionLoading;
}

/// @nodoc
abstract class $UnionErrorCopyWith<$Res> {
  factory $UnionErrorCopyWith(
          UnionError value, $Res Function(UnionError) then) =
      _$UnionErrorCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class _$UnionErrorCopyWithImpl<$Res> extends _$UnionCopyWithImpl<$Res>
    implements $UnionErrorCopyWith<$Res> {
  _$UnionErrorCopyWithImpl(UnionError _value, $Res Function(UnionError) _then)
      : super(_value, (v) => _then(v as UnionError));

  @override
  UnionError get _value => super._value as UnionError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(UnionError(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnionError implements UnionError {
  _$UnionError({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'Union.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnionError &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $UnionErrorCopyWith<UnionError> get copyWith =>
      _$UnionErrorCopyWithImpl<UnionError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int value) $default, {
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(int value)? $default, {
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int value)? $default, {
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(UnionData value) $default, {
    required TResult Function(UnionLoading value) loading,
    required TResult Function(UnionError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(UnionData value)? $default, {
    TResult Function(UnionLoading value)? loading,
    TResult Function(UnionError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(UnionData value)? $default, {
    TResult Function(UnionLoading value)? loading,
    TResult Function(UnionError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class UnionError implements Union {
  factory UnionError({final String? message}) = _$UnionError;

  String? get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnionErrorCopyWith<UnionError> get copyWith =>
      throw _privateConstructorUsedError;
}
