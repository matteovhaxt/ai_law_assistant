// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InputState _$$_InputStateFromJson(Map<String, dynamic> json) =>
    _$_InputState(
      isPickingPdf: json['isPickingPdf'] as bool? ?? false,
      isUploadingToStorage: json['isUploadingToStorage'] as bool? ?? false,
      isMakingRequest: json['isMakingRequest'] as bool? ?? false,
      text: json['text'] as String?,
      pdfName: json['pdfName'] as String?,
      pdfData:
          (json['pdfData'] as List<dynamic>?)?.map((e) => e as int).toList(),
      pdfUrl: json['pdfUrl'] as String?,
    );

Map<String, dynamic> _$$_InputStateToJson(_$_InputState instance) =>
    <String, dynamic>{
      'isPickingPdf': instance.isPickingPdf,
      'isUploadingToStorage': instance.isUploadingToStorage,
      'isMakingRequest': instance.isMakingRequest,
      'text': instance.text,
      'pdfName': instance.pdfName,
      'pdfData': instance.pdfData,
      'pdfUrl': instance.pdfUrl,
    };
