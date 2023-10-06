// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginModelImpl _$$LoginModelImplFromJson(Map<String, dynamic> json) =>
    _$LoginModelImpl(
      mobile: json['mobile'] as String?,
      password: json['password'] as String?,
      token: json['token'] as String?,
      oneSignalID: json['oneSignalID'] as String?,
    );

Map<String, dynamic> _$$LoginModelImplToJson(_$LoginModelImpl instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'password': instance.password,
      'token': instance.token,
      'oneSignalID': instance.oneSignalID,
    };
