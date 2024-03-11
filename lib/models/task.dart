import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
abstract class Task with _$Task {
  factory Task({
    String? id,
    required int taskNumber,
    required String productName,
    required String responsibleId,
    required String actionType,
    required DateTime deleveryTime,
    required String barcode,
    required int quantity,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  factory Task.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return Task.fromJson(data).copyWith(id: doc.id);
  }
  Map<String, dynamic> toDocument() => toJson()..remove('id');

  factory Task.fromSheets(List<dynamic> record) {
    return Task(
      taskNumber: int.parse(record[0].toString()),
      productName: record[2].toString(),
      responsibleId: record[3].toString(),
      actionType: record[4].toString(),
      deleveryTime: DateTime.parse(record[5].toString()),
      barcode: record[6].toString(),
      quantity: int.parse(record[7].toString()),
    );
  }
}
