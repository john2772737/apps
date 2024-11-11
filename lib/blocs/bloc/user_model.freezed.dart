// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get fullName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phoneNo => throw _privateConstructorUsedError;
  String get jobPosition => throw _privateConstructorUsedError;
  String get school => throw _privateConstructorUsedError;
  DateTime get birthdate => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String fullName,
      String email,
      String phoneNo,
      String jobPosition,
      String school,
      DateTime birthdate,
      String address,
      String password,
      String imageUrl});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? email = null,
    Object? phoneNo = null,
    Object? jobPosition = null,
    Object? school = null,
    Object? birthdate = null,
    Object? address = null,
    Object? password = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNo: null == phoneNo
          ? _value.phoneNo
          : phoneNo // ignore: cast_nullable_to_non_nullable
              as String,
      jobPosition: null == jobPosition
          ? _value.jobPosition
          : jobPosition // ignore: cast_nullable_to_non_nullable
              as String,
      school: null == school
          ? _value.school
          : school // ignore: cast_nullable_to_non_nullable
              as String,
      birthdate: null == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fullName,
      String email,
      String phoneNo,
      String jobPosition,
      String school,
      DateTime birthdate,
      String address,
      String password,
      String imageUrl});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? email = null,
    Object? phoneNo = null,
    Object? jobPosition = null,
    Object? school = null,
    Object? birthdate = null,
    Object? address = null,
    Object? password = null,
    Object? imageUrl = null,
  }) {
    return _then(_$UserModelImpl(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNo: null == phoneNo
          ? _value.phoneNo
          : phoneNo // ignore: cast_nullable_to_non_nullable
              as String,
      jobPosition: null == jobPosition
          ? _value.jobPosition
          : jobPosition // ignore: cast_nullable_to_non_nullable
              as String,
      school: null == school
          ? _value.school
          : school // ignore: cast_nullable_to_non_nullable
              as String,
      birthdate: null == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  _$UserModelImpl(
      {required this.fullName,
      required this.email,
      required this.phoneNo,
      required this.jobPosition,
      required this.school,
      required this.birthdate,
      required this.address,
      required this.password,
      required this.imageUrl});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String fullName;
  @override
  final String email;
  @override
  final String phoneNo;
  @override
  final String jobPosition;
  @override
  final String school;
  @override
  final DateTime birthdate;
  @override
  final String address;
  @override
  final String password;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'UserModel(fullName: $fullName, email: $email, phoneNo: $phoneNo, jobPosition: $jobPosition, school: $school, birthdate: $birthdate, address: $address, password: $password, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNo, phoneNo) || other.phoneNo == phoneNo) &&
            (identical(other.jobPosition, jobPosition) ||
                other.jobPosition == jobPosition) &&
            (identical(other.school, school) || other.school == school) &&
            (identical(other.birthdate, birthdate) ||
                other.birthdate == birthdate) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fullName, email, phoneNo,
      jobPosition, school, birthdate, address, password, imageUrl);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {required final String fullName,
      required final String email,
      required final String phoneNo,
      required final String jobPosition,
      required final String school,
      required final DateTime birthdate,
      required final String address,
      required final String password,
      required final String imageUrl}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get fullName;
  @override
  String get email;
  @override
  String get phoneNo;
  @override
  String get jobPosition;
  @override
  String get school;
  @override
  DateTime get birthdate;
  @override
  String get address;
  @override
  String get password;
  @override
  String get imageUrl;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
