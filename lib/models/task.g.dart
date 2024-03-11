// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['id'] as String?,
      taskNumber: json['taskNumber'] as int,
      productName: json['productName'] as String,
      responsibleId: json['responsibleId'] as String,
      actionType: json['actionType'] as String,
      deleveryTime: DateTime.parse(json['deleveryTime'] as String),
      barcode: json['barcode'] as String,
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taskNumber': instance.taskNumber,
      'productName': instance.productName,
      'responsibleId': instance.responsibleId,
      'actionType': instance.actionType,
      'deleveryTime': instance.deleveryTime.toIso8601String(),
      'barcode': instance.barcode,
      'quantity': instance.quantity,
    };
