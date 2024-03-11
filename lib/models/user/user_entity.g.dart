// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      uid: json['uid'] as String? ?? '',
      username: json['username'] as String,
      password: json['password'] as String,
      isAdmin: json['isAdmin'] as bool? ?? false,
      isAuthenticated: json['isAuthenticated'] as bool? ?? false,
      department:
          Department.fromJson(json['department'] as Map<String, dynamic>),
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
      rowNumber: json['rowNumber'] as int,
      lastStatusTime: json['lastStatusTime'] ?? DateTime.now,
      lastActive: json['lastActive'] ?? DateTime.now,
      createdAt: json['createdAt'] ?? DateTime.now,
      updatedAt: json['updatedAt'] ?? DateTime.now,
      timePeriodStatus: json['timePeriodStatus'] as int? ?? 0,
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'username': instance.username,
      'password': instance.password,
      'isAdmin': instance.isAdmin,
      'isAuthenticated': instance.isAuthenticated,
      'department': instance.department,
      'status': instance.status,
      'rowNumber': instance.rowNumber,
      'lastStatusTime': instance.lastStatusTime,
      'lastActive': instance.lastActive,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'timePeriodStatus': instance.timePeriodStatus,
    };
