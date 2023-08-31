// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthState _$$_AuthStateFromJson(Map<String, dynamic> json) => _$_AuthState(
      isLoading: json['isLoading'] as bool? ?? false,
      isAuthenticated: json['isAuthenticated'] as bool? ?? false,
    );

Map<String, dynamic> _$$_AuthStateToJson(_$_AuthState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'isAuthenticated': instance.isAuthenticated,
    };
