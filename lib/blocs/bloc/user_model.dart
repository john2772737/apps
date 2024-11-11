import 'dart:typed_data';  // For Uint8List
import 'dart:convert';  // For base64 encoding/decoding

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

// Custom converter to handle Uint8List serialization and deserialization
class Uint8ListConverter implements JsonConverter<Uint8List, String> {
  const Uint8ListConverter();

  @override
  Uint8List fromJson(String json) {
    return base64Decode(json);  // Decodes a Base64 string to Uint8List
  }

  @override
  String toJson(Uint8List object) {
    return base64Encode(object);  // Encodes Uint8List to a Base64 string
  }
}

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

    @Uint8ListConverter() required Uint8List imageUrl,  // Use the custom converter here
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
