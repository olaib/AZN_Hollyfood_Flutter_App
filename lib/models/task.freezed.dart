// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  String? get id => throw _privateConstructorUsedError;
  int get taskNumber => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get responsibleId => throw _privateConstructorUsedError;
  String get actionType => throw _privateConstructorUsedError;
  DateTime get deleveryTime => throw _privateConstructorUsedError;
  String get barcode => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {String? id,
      int taskNumber,
      String productName,
      String responsibleId,
      String actionType,
      DateTime deleveryTime,
      String barcode,
      int quantity});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? taskNumber = null,
    Object? productName = null,
    Object? responsibleId = null,
    Object? actionType = null,
    Object? deleveryTime = null,
    Object? barcode = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      taskNumber: null == taskNumber
          ? _value.taskNumber
          : taskNumber // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      responsibleId: null == responsibleId
          ? _value.responsibleId
          : responsibleId // ignore: cast_nullable_to_non_nullable
              as String,
      actionType: null == actionType
          ? _value.actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as String,
      deleveryTime: null == deleveryTime
          ? _value.deleveryTime
          : deleveryTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      int taskNumber,
      String productName,
      String responsibleId,
      String actionType,
      DateTime deleveryTime,
      String barcode,
      int quantity});
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? taskNumber = null,
    Object? productName = null,
    Object? responsibleId = null,
    Object? actionType = null,
    Object? deleveryTime = null,
    Object? barcode = null,
    Object? quantity = null,
  }) {
    return _then(_$TaskImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      taskNumber: null == taskNumber
          ? _value.taskNumber
          : taskNumber // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      responsibleId: null == responsibleId
          ? _value.responsibleId
          : responsibleId // ignore: cast_nullable_to_non_nullable
              as String,
      actionType: null == actionType
          ? _value.actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as String,
      deleveryTime: null == deleveryTime
          ? _value.deleveryTime
          : deleveryTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskImpl implements _Task {
  _$TaskImpl(
      {this.id,
      required this.taskNumber,
      required this.productName,
      required this.responsibleId,
      required this.actionType,
      required this.deleveryTime,
      required this.barcode,
      required this.quantity});

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  @override
  final String? id;
  @override
  final int taskNumber;
  @override
  final String productName;
  @override
  final String responsibleId;
  @override
  final String actionType;
  @override
  final DateTime deleveryTime;
  @override
  final String barcode;
  @override
  final int quantity;

  @override
  String toString() {
    return 'Task(id: $id, taskNumber: $taskNumber, productName: $productName, responsibleId: $responsibleId, actionType: $actionType, deleveryTime: $deleveryTime, barcode: $barcode, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.taskNumber, taskNumber) ||
                other.taskNumber == taskNumber) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.responsibleId, responsibleId) ||
                other.responsibleId == responsibleId) &&
            (identical(other.actionType, actionType) ||
                other.actionType == actionType) &&
            (identical(other.deleveryTime, deleveryTime) ||
                other.deleveryTime == deleveryTime) &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, taskNumber, productName,
      responsibleId, actionType, deleveryTime, barcode, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(
      this,
    );
  }

  @override
  Map<String, dynamic> toDocument() => toJson()..remove('uid');
}

abstract class _Task implements Task {
  factory _Task(
      {final String? id,
      required final int taskNumber,
      required final String productName,
      required final String responsibleId,
      required final String actionType,
      required final DateTime deleveryTime,
      required final String barcode,
      required final int quantity}) = _$TaskImpl;

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  String? get id;
  @override
  int get taskNumber;
  @override
  String get productName;
  @override
  String get responsibleId;
  @override
  String get actionType;
  @override
  DateTime get deleveryTime;
  @override
  String get barcode;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
