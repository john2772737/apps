// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      phoneNo: json['phoneNo'] as String,
      jobPosition: json['jobPosition'] as String,
      school: json['school'] as String,
      birthdate: DateTime.parse(json['birthdate'] as String),
      address: json['address'] as String,
      password: json['password'] as String,
      imageUrl: const Uint8ListConverter().fromJson(json['imageUrl'] as String),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'phoneNo': instance.phoneNo,
      'jobPosition': instance.jobPosition,
      'school': instance.school,
      'birthdate': instance.birthdate.toIso8601String(),
      'address': instance.address,
      'password': instance.password,
      'imageUrl': const Uint8ListConverter().toJson(instance.imageUrl),
    };
