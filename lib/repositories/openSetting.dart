import 'package:open_settings/open_settings.dart' as Settings;

Future<void> openWifiSettings() async {
  // Calling the static method directly from the class.
  await Settings.OpenSettings.openWifiIpSetting();
}
