import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';



part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  factory UserEntity({
    @Default('') String uid,
    required String username, 
    required String password,
    @Default(false) bool isAdmin,
    @Default(false) bool isAuthenticated,
    required String department,
    @Default('בחוץ') String status,
    required int rowNumber,
    @Default(Timestamp.now) lastStatusTime,
    @Default(Timestamp.now) lastActive,
    @Default(Timestamp.now) createdAt,
    @Default(Timestamp.now) updatedAt,
    @Default(0) int timePeriodStatus,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  factory UserEntity.fromSheets(List<dynamic> record) {
    final lastStatusTime = Timestamp.fromMillisecondsSinceEpoch(
        (record[6] == "" || record[6] == null) ? 0 : record[6]);
    
    int timePeriodStatus = 0;
    List<String> timePeriodParts;
    if (record[7] == "" || record[7] == null) {
      timePeriodParts = ["0", "0", "0"];
    } else {
      timePeriodParts = record[7].toString().split(':');
      int hours = int.parse(timePeriodParts[0]);
      int minutes = int.parse(timePeriodParts[1]);
      int seconds = int.parse(timePeriodParts[2]);
      timePeriodStatus = hours * 3600 + minutes * 60 + seconds;
    }

    final currentDate = Timestamp.now();

    return UserEntity(
      username: record[1],
      password: record[2],
      department: record[3],
      status: record[4],
      rowNumber: int.parse(record[0]),
      lastStatusTime: lastStatusTime,
      timePeriodStatus: timePeriodStatus,
      lastActive: currentDate,
      createdAt: currentDate,
      updatedAt: currentDate,
    );
  }
}



class Timestamp {
  final int millisecondsSinceEpoch;
  Timestamp.now()
      : millisecondsSinceEpoch = DateTime.now().millisecondsSinceEpoch;
  Timestamp.fromMillisecondsSinceEpoch(this.millisecondsSinceEpoch);

  DateTime toDate() {
    return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  }
}
