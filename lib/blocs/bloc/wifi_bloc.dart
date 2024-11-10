import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'wifi_event.dart';
import 'wifi_state.dart';

class WifiBloc extends Bloc<WifiEvent, WifiState> {
  final Connectivity _connectivity = Connectivity();

  WifiBloc() : super(const Initial()) {
    on<Status>(_onWifiEventStatus);
  }

  Future<void> _onWifiEventStatus(
    WifiEvent event,
    Emitter<WifiState> emit,
  ) async {
    int retries = 3;

    // Retry logic for checking connectivity status
    while (retries > 0) {
      final connectivityResult = await _connectivity.checkConnectivity();
      print('WifiBloc: Checking connectivity status, retries: $retries');
      print('WifiBloc: Connectivity result: $connectivityResult');
      // Check for Wi-Fi off state
      if (connectivityResult == ConnectivityResult.none) {
        emit(notConnected());
        return;
      }

      // If a connection is detected
     else if ( connectivityResult == ConnectivityResult.mobile) {
        emit(Connected());
    
        return;
      }

      retries--;
      await Future.delayed(Duration(seconds: 2));
    }

    // If retries are exhausted and no connection is found
    emit(Error("No network connection available."));
  }

  Future<bool> hasInternetAccess() async {
    try {
      final response = await http.get(Uri.parse('https://www.google.com'));
      return response.statusCode == 200;
    } catch (_) {
      print('WifiBloc: No internet access');
      return false;//dsdd
    }
  }
}
