import 'package:freezed_annotation/freezed_annotation.dart';

part 'wifi_state.freezed.dart';

@freezed
class WifiState with _$WifiState {
  
  const factory WifiState.initial() = Initial;
  const factory WifiState.loading() = Loading;
  const factory WifiState.conneted() = Connected;
  const factory WifiState.notConnected() = notConnected;
  const factory WifiState.error(String message) = Error;
}
