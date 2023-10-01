// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InputState _$InputStateFromJson(Map<String, dynamic> json) {
  return _InputState.fromJson(json);
}

/// @nodoc
mixin _$InputState {
  bool get isLoading => throw _privateConstructorUsedError;
  SubmitMethod? get method => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  String? get pdfContent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InputStateCopyWith<InputState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InputStateCopyWith<$Res> {
  factory $InputStateCopyWith(
          InputState value, $Res Function(InputState) then) =
      _$InputStateCopyWithImpl<$Res, InputState>;
  @useResult
  $Res call(
      {bool isLoading, SubmitMethod? method, String? text, String? pdfContent});
}

/// @nodoc
class _$InputStateCopyWithImpl<$Res, $Val extends InputState>
    implements $InputStateCopyWith<$Res> {
  _$InputStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? method = freezed,
    Object? text = freezed,
    Object? pdfContent = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      method: freezed == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as SubmitMethod?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      pdfContent: freezed == pdfContent
          ? _value.pdfContent
          : pdfContent // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InputStateCopyWith<$Res>
    implements $InputStateCopyWith<$Res> {
  factory _$$_InputStateCopyWith(
          _$_InputState value, $Res Function(_$_InputState) then) =
      __$$_InputStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading, SubmitMethod? method, String? text, String? pdfContent});
}

/// @nodoc
class __$$_InputStateCopyWithImpl<$Res>
    extends _$InputStateCopyWithImpl<$Res, _$_InputState>
    implements _$$_InputStateCopyWith<$Res> {
  __$$_InputStateCopyWithImpl(
      _$_InputState _value, $Res Function(_$_InputState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? method = freezed,
    Object? text = freezed,
    Object? pdfContent = freezed,
  }) {
    return _then(_$_InputState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      method: freezed == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as SubmitMethod?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      pdfContent: freezed == pdfContent
          ? _value.pdfContent
          : pdfContent // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InputState implements _InputState {
  const _$_InputState(
      {this.isLoading = false, this.method, this.text, this.pdfContent});

  factory _$_InputState.fromJson(Map<String, dynamic> json) =>
      _$$_InputStateFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final SubmitMethod? method;
  @override
  final String? text;
  @override
  final String? pdfContent;

  @override
  String toString() {
    return 'InputState(isLoading: $isLoading, method: $method, text: $text, pdfContent: $pdfContent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InputState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.pdfContent, pdfContent) ||
                other.pdfContent == pdfContent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, method, text, pdfContent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InputStateCopyWith<_$_InputState> get copyWith =>
      __$$_InputStateCopyWithImpl<_$_InputState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InputStateToJson(
      this,
    );
  }
}

abstract class _InputState implements InputState {
  const factory _InputState(
      {final bool isLoading,
      final SubmitMethod? method,
      final String? text,
      final String? pdfContent}) = _$_InputState;

  factory _InputState.fromJson(Map<String, dynamic> json) =
      _$_InputState.fromJson;

  @override
  bool get isLoading;
  @override
  SubmitMethod? get method;
  @override
  String? get text;
  @override
  String? get pdfContent;
  @override
  @JsonKey(ignore: true)
  _$$_InputStateCopyWith<_$_InputState> get copyWith =>
      throw _privateConstructorUsedError;
}
