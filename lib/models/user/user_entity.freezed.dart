// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return _UserEntity.fromJson(json);
}

/// @nodoc
mixin _$UserEntity {
  String get uid => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  bool get isAdmin => throw _privateConstructorUsedError;
  bool get isAuthenticated => throw _privateConstructorUsedError;
  @JsonKey(fromJson: Department.fromJson)
  Department get department => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  int get rowNumber => throw _privateConstructorUsedError;
  dynamic get lastStatusTime => throw _privateConstructorUsedError;
  dynamic get lastActive => throw _privateConstructorUsedError;
  dynamic get createdAt => throw _privateConstructorUsedError;
  dynamic get updatedAt => throw _privateConstructorUsedError;
  int get timePeriodStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserEntityCopyWith<UserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEntityCopyWith<$Res> {
  factory $UserEntityCopyWith(
          UserEntity value, $Res Function(UserEntity) then) =
      _$UserEntityCopyWithImpl<$Res, UserEntity>;
  @useResult
  $Res call(
      {String uid,
      String username,
      String password,
      bool isAdmin,
      bool isAuthenticated,
      @JsonKey(fromJson: Department.fromJson) Department department,
      Status status,
      int rowNumber,
      dynamic lastStatusTime,
      dynamic lastActive,
      dynamic createdAt,
      dynamic updatedAt,
      int timePeriodStatus});

  $DepartmentCopyWith<$Res> get department;
  $StatusCopyWith<$Res> get status;
}

/// @nodoc
class _$UserEntityCopyWithImpl<$Res, $Val extends UserEntity>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? username = null,
    Object? password = null,
    Object? isAdmin = null,
    Object? isAuthenticated = null,
    Object? department = null,
    Object? status = null,
    Object? rowNumber = null,
    Object? lastStatusTime = freezed,
    Object? lastActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? timePeriodStatus = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuthenticated: null == isAuthenticated
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      rowNumber: null == rowNumber
          ? _value.rowNumber
          : rowNumber // ignore: cast_nullable_to_non_nullable
              as int,
      lastStatusTime: freezed == lastStatusTime
          ? _value.lastStatusTime
          : lastStatusTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastActive: freezed == lastActive
          ? _value.lastActive
          : lastActive // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      timePeriodStatus: null == timePeriodStatus
          ? _value.timePeriodStatus
          : timePeriodStatus // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DepartmentCopyWith<$Res> get department {
    return $DepartmentCopyWith<$Res>(_value.department, (value) {
      return _then(_value.copyWith(department: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get status {
    return $StatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserEntityImplCopyWith<$Res>
    implements $UserEntityCopyWith<$Res> {
  factory _$$UserEntityImplCopyWith(
          _$UserEntityImpl value, $Res Function(_$UserEntityImpl) then) =
      __$$UserEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String username,
      String password,
      bool isAdmin,
      bool isAuthenticated,
      @JsonKey(fromJson: Department.fromJson) Department department,
      Status status,
      int rowNumber,
      dynamic lastStatusTime,
      dynamic lastActive,
      dynamic createdAt,
      dynamic updatedAt,
      int timePeriodStatus});

  @override
  $DepartmentCopyWith<$Res> get department;
  @override
  $StatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$UserEntityImplCopyWithImpl<$Res>
    extends _$UserEntityCopyWithImpl<$Res, _$UserEntityImpl>
    implements _$$UserEntityImplCopyWith<$Res> {
  __$$UserEntityImplCopyWithImpl(
      _$UserEntityImpl _value, $Res Function(_$UserEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? username = null,
    Object? password = null,
    Object? isAdmin = null,
    Object? isAuthenticated = null,
    Object? department = null,
    Object? status = null,
    Object? rowNumber = null,
    Object? lastStatusTime = freezed,
    Object? lastActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? timePeriodStatus = null,
  }) {
    return _then(_$UserEntityImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuthenticated: null == isAuthenticated
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      rowNumber: null == rowNumber
          ? _value.rowNumber
          : rowNumber // ignore: cast_nullable_to_non_nullable
              as int,
      lastStatusTime:
          freezed == lastStatusTime ? _value.lastStatusTime! : lastStatusTime,
      lastActive: freezed == lastActive ? _value.lastActive! : lastActive,
      createdAt: freezed == createdAt ? _value.createdAt! : createdAt,
      updatedAt: freezed == updatedAt ? _value.updatedAt! : updatedAt,
      timePeriodStatus: null == timePeriodStatus
          ? _value.timePeriodStatus
          : timePeriodStatus // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserEntityImpl implements _UserEntity {
  _$UserEntityImpl(
      {this.uid = '',
      required this.username,
      required this.password,
      this.isAdmin = false,
      this.isAuthenticated = false,
      @JsonKey(fromJson: Department.fromJson) required this.department,
      required this.status,
      required this.rowNumber,
      this.lastStatusTime = DateTime.now,
      this.lastActive = DateTime.now,
      this.createdAt = DateTime.now,
      this.updatedAt = DateTime.now,
      this.timePeriodStatus = 0});

  factory _$UserEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserEntityImplFromJson(json);

  @override
  @JsonKey()
  final String uid;
  @override
  final String username;
  @override
  final String password;
  @override
  @JsonKey()
  final bool isAdmin;
  @override
  @JsonKey()
  final bool isAuthenticated;
  @override
  @JsonKey(fromJson: Department.fromJson)
  final Department department;
  @override
  final Status status;
  @override
  final int rowNumber;
  @override
  @JsonKey()
  final dynamic lastStatusTime;
  @override
  @JsonKey()
  final dynamic lastActive;
  @override
  @JsonKey()
  final dynamic createdAt;
  @override
  @JsonKey()
  final dynamic updatedAt;
  @override
  @JsonKey()
  final int timePeriodStatus;

  @override
  String toString() {
    return 'UserEntity(uid: $uid, username: $username, password: $password, isAdmin: $isAdmin, isAuthenticated: $isAuthenticated, department: $department, status: $status, rowNumber: $rowNumber, lastStatusTime: $lastStatusTime, lastActive: $lastActive, createdAt: $createdAt, updatedAt: $updatedAt, timePeriodStatus: $timePeriodStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEntityImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin) &&
            (identical(other.isAuthenticated, isAuthenticated) ||
                other.isAuthenticated == isAuthenticated) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.rowNumber, rowNumber) ||
                other.rowNumber == rowNumber) &&
            const DeepCollectionEquality()
                .equals(other.lastStatusTime, lastStatusTime) &&
            const DeepCollectionEquality()
                .equals(other.lastActive, lastActive) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            (identical(other.timePeriodStatus, timePeriodStatus) ||
                other.timePeriodStatus == timePeriodStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      username,
      password,
      isAdmin,
      isAuthenticated,
      department,
      status,
      rowNumber,
      const DeepCollectionEquality().hash(lastStatusTime),
      const DeepCollectionEquality().hash(lastActive),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      timePeriodStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      __$$UserEntityImplCopyWithImpl<_$UserEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserEntityImplToJson(
      this,
    );
  }

  @override
  Map<String, dynamic> toDocument() {
    return _$$UserEntityImplToJson(this)..remove('uid');
  }
}

abstract class _UserEntity implements UserEntity {
  factory _UserEntity(
      {final String uid,
      required final String username,
      required final String password,
      final bool isAdmin,
      final bool isAuthenticated,
      @JsonKey(fromJson: Department.fromJson)
      required final Department department,
      required final Status status,
      required final int rowNumber,
      final dynamic lastStatusTime,
      final dynamic lastActive,
      final dynamic createdAt,
      final dynamic updatedAt,
      final int timePeriodStatus}) = _$UserEntityImpl;

  factory _UserEntity.fromJson(Map<String, dynamic> json) =
      _$UserEntityImpl.fromJson;

  @override
  String get uid;
  @override
  String get username;
  @override
  String get password;
  @override
  bool get isAdmin;
  @override
  bool get isAuthenticated;
  @override
  @JsonKey(fromJson: Department.fromJson)
  Department get department;
  @override
  Status get status;
  @override
  int get rowNumber;
  @override
  dynamic get lastStatusTime;
  @override
  dynamic get lastActive;
  @override
  dynamic get createdAt;
  @override
  dynamic get updatedAt;
  @override
  int get timePeriodStatus;
  @override
  @JsonKey(ignore: true)
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
