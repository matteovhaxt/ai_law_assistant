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
  bool get isPickingPdf => throw _privateConstructorUsedError;
  bool get isUploadingToStorage => throw _privateConstructorUsedError;
  bool get isMakingRequest => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  String? get pdfName => throw _privateConstructorUsedError;
  List<int>? get pdfData => throw _privateConstructorUsedError;
  String? get pdfUrl => throw _privateConstructorUsedError;

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
      {bool isPickingPdf,
      bool isUploadingToStorage,
      bool isMakingRequest,
      String? text,
      String? pdfName,
      List<int>? pdfData,
      String? pdfUrl});
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
    Object? isPickingPdf = null,
    Object? isUploadingToStorage = null,
    Object? isMakingRequest = null,
    Object? text = freezed,
    Object? pdfName = freezed,
    Object? pdfData = freezed,
    Object? pdfUrl = freezed,
  }) {
    return _then(_value.copyWith(
      isPickingPdf: null == isPickingPdf
          ? _value.isPickingPdf
          : isPickingPdf // ignore: cast_nullable_to_non_nullable
              as bool,
      isUploadingToStorage: null == isUploadingToStorage
          ? _value.isUploadingToStorage
          : isUploadingToStorage // ignore: cast_nullable_to_non_nullable
              as bool,
      isMakingRequest: null == isMakingRequest
          ? _value.isMakingRequest
          : isMakingRequest // ignore: cast_nullable_to_non_nullable
              as bool,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      pdfName: freezed == pdfName
          ? _value.pdfName
          : pdfName // ignore: cast_nullable_to_non_nullable
              as String?,
      pdfData: freezed == pdfData
          ? _value.pdfData
          : pdfData // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      pdfUrl: freezed == pdfUrl
          ? _value.pdfUrl
          : pdfUrl // ignore: cast_nullable_to_non_nullable
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
      {bool isPickingPdf,
      bool isUploadingToStorage,
      bool isMakingRequest,
      String? text,
      String? pdfName,
      List<int>? pdfData,
      String? pdfUrl});
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
    Object? isPickingPdf = null,
    Object? isUploadingToStorage = null,
    Object? isMakingRequest = null,
    Object? text = freezed,
    Object? pdfName = freezed,
    Object? pdfData = freezed,
    Object? pdfUrl = freezed,
  }) {
    return _then(_$_InputState(
      isPickingPdf: null == isPickingPdf
          ? _value.isPickingPdf
          : isPickingPdf // ignore: cast_nullable_to_non_nullable
              as bool,
      isUploadingToStorage: null == isUploadingToStorage
          ? _value.isUploadingToStorage
          : isUploadingToStorage // ignore: cast_nullable_to_non_nullable
              as bool,
      isMakingRequest: null == isMakingRequest
          ? _value.isMakingRequest
          : isMakingRequest // ignore: cast_nullable_to_non_nullable
              as bool,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      pdfName: freezed == pdfName
          ? _value.pdfName
          : pdfName // ignore: cast_nullable_to_non_nullable
              as String?,
      pdfData: freezed == pdfData
          ? _value._pdfData
          : pdfData // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      pdfUrl: freezed == pdfUrl
          ? _value.pdfUrl
          : pdfUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InputState implements _InputState {
  const _$_InputState(
      {this.isPickingPdf = false,
      this.isUploadingToStorage = false,
      this.isMakingRequest = false,
      this.text,
      this.pdfName,
      final List<int>? pdfData,
      this.pdfUrl})
      : _pdfData = pdfData;

  factory _$_InputState.fromJson(Map<String, dynamic> json) =>
      _$$_InputStateFromJson(json);

  @override
  @JsonKey()
  final bool isPickingPdf;
  @override
  @JsonKey()
  final bool isUploadingToStorage;
  @override
  @JsonKey()
  final bool isMakingRequest;
  @override
  final String? text;
  @override
  final String? pdfName;
  final List<int>? _pdfData;
  @override
  List<int>? get pdfData {
    final value = _pdfData;
    if (value == null) return null;
    if (_pdfData is EqualUnmodifiableListView) return _pdfData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? pdfUrl;

  @override
  String toString() {
    return 'InputState(isPickingPdf: $isPickingPdf, isUploadingToStorage: $isUploadingToStorage, isMakingRequest: $isMakingRequest, text: $text, pdfName: $pdfName, pdfData: $pdfData, pdfUrl: $pdfUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InputState &&
            (identical(other.isPickingPdf, isPickingPdf) ||
                other.isPickingPdf == isPickingPdf) &&
            (identical(other.isUploadingToStorage, isUploadingToStorage) ||
                other.isUploadingToStorage == isUploadingToStorage) &&
            (identical(other.isMakingRequest, isMakingRequest) ||
                other.isMakingRequest == isMakingRequest) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.pdfName, pdfName) || other.pdfName == pdfName) &&
            const DeepCollectionEquality().equals(other._pdfData, _pdfData) &&
            (identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isPickingPdf,
      isUploadingToStorage,
      isMakingRequest,
      text,
      pdfName,
      const DeepCollectionEquality().hash(_pdfData),
      pdfUrl);

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
      {final bool isPickingPdf,
      final bool isUploadingToStorage,
      final bool isMakingRequest,
      final String? text,
      final String? pdfName,
      final List<int>? pdfData,
      final String? pdfUrl}) = _$_InputState;

  factory _InputState.fromJson(Map<String, dynamic> json) =
      _$_InputState.fromJson;

  @override
  bool get isPickingPdf;
  @override
  bool get isUploadingToStorage;
  @override
  bool get isMakingRequest;
  @override
  String? get text;
  @override
  String? get pdfName;
  @override
  List<int>? get pdfData;
  @override
  String? get pdfUrl;
  @override
  @JsonKey(ignore: true)
  _$$_InputStateCopyWith<_$_InputState> get copyWith =>
      throw _privateConstructorUsedError;
}
