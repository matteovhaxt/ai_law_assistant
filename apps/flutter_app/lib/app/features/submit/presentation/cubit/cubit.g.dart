// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InputState _$$_InputStateFromJson(Map<String, dynamic> json) =>
    _$_InputState(
      isLoading: json['isLoading'] as bool? ?? false,
      method: $enumDecodeNullable(_$SubmitMethodEnumMap, json['method']),
      text: json['text'] as String?,
      pdfBytes:
          (json['pdfBytes'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$_InputStateToJson(_$_InputState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'method': _$SubmitMethodEnumMap[instance.method],
      'text': instance.text,
      'pdfBytes': instance.pdfBytes,
    };

const _$SubmitMethodEnumMap = {
  SubmitMethod.text: 'text',
  SubmitMethod.pdf: 'pdf',
  SubmitMethod.camera: 'camera',
};
