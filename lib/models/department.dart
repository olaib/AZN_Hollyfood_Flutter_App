
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'department.g.dart';
part 'department.freezed.dart';

@freezed
abstract class Department with _$Department {

  const factory Department({
      @Default('') String uid,
      required String name,
    }) = _Department;

  factory Department.fromJson(Map<String, dynamic> json) => _$DepartmentFromJson(json);

    factory Department.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return Department.fromJson(data).copyWith(uid: doc.id);
  }
  Map<String, dynamic> toDocument() => toJson()..remove('uid');
}
