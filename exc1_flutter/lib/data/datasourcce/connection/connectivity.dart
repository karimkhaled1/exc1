import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

abstract class ConnectionCheck {
  bool isConnected();
  Future init();
}

class ConnectivityService implements ConnectionCheck {
  static final ConnectivityService _connection = ConnectivityService._internal();

  factory ConnectivityService() {
    return _connection;
  }

  ConnectivityService._internal() {
    init();
  }

  ConnectivityResult connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();

  @override
  Future<void> init() async {
    await initConnectivity();

  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } catch (e) {
      return;
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    connectionStatus = result;
  }

  @override
  bool isConnected() =>  connectionStatus != ConnectivityResult.none;
}
