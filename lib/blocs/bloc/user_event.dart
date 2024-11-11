import 'user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_event.freezed.dart';
@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.submit(
    {
    required String email,
    required String password,
    }
  ) = Submit;
  const factory UserEvent.logout() = Logout;
  const factory UserEvent.fetchUser({required int userId}) = FetchUser;
}
