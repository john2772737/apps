import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    required String fullName,
    required String email,
    required String phoneNo,
    required String jobPosition,
    required String school,
    required DateTime birthdate,
    required String address,
    required String password,
    
    required String imageUrl, // URL or path to the user's image
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);


}


