import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = Initial;
  const factory UserState.success() = Success;
  const factory UserState.error(String message) = Error;
  const factory UserState.loading() = Loading;
}
