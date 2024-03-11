import 'package:azn_hollyfood_flutter_app/models/status.dart';
import 'package:azn_hollyfood_flutter_app/models/department.dart';
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
    @JsonKey(fromJson: Department.fromJson)
    required Department department,
    required Status status,
    required int rowNumber,
    @Default(DateTime.now) lastStatusTime,
    @Default(DateTime.now) lastActive,
    @Default(DateTime.now) createdAt,
    @Default(DateTime.now) updatedAt,
    @Default(0) int timePeriodStatus,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  factory UserEntity.fromSheets(List<dynamic> record) {
    int unixTimestamp = (record[6] != null && record[6].isNotEmpty)
        ? ((double.parse(record[6].toString()) - 25569) * 86400000).toInt()
        : DateTime.now().millisecondsSinceEpoch;
    DateTime date =
        DateTime.fromMillisecondsSinceEpoch(unixTimestamp, isUtc: true);

    final currentDate = DateTime.now();

    return UserEntity(
      username: record[1],
      password: record[2],
      department: record[3],
      status: record[4],
      rowNumber: int.parse(record[0]),
      lastStatusTime: date,
      timePeriodStatus: int.tryParse(record[7].toString().trim()) ?? 0,
      lastActive: currentDate,
      createdAt: currentDate,
      updatedAt: currentDate,
    );
  }

  static List<dynamic> toSheets(UserEntity user) =>
      [...user.toJson().values]..removeAt(0);

  factory UserEntity.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return UserEntity.fromJson(data).copyWith(uid: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('uid');
}


// class Timestamp {
//   final int millisecondsSinceEpoch;
//   Timestamp.now()
//       : millisecondsSinceEpoch = DateTime.now().millisecondsSinceEpoch;
//   Timestamp.fromMillisecondsSinceEpoch(this.millisecondsSinceEpoch);

//   DateTime toDate() {
//     return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
//   }
// }
