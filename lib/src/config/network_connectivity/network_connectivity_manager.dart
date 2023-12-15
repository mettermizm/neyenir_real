import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:neyenir_app/src/core/enums/network_connectivity_enums.dart';

typedef NetworkCallBack = void Function(NetworkConnectivityResult result);

/// This class is responsible for checking the network connectivity status and notifying the listeners
/// about the network change
abstract class INetworkConnectivityManager {
  Future<NetworkConnectivityResult> checkNetworkFirstTime();
  void handleNetworkChange(NetworkCallBack onChange);
  void dispose();
}

/// It's a wrapper around the connectivity package
class NetworkConnectivityManager extends INetworkConnectivityManager {
  late final Connectivity _connectivity;
  StreamSubscription<ConnectivityResult>? _subscription;

  NetworkConnectivityManager() {
    _connectivity = Connectivity();
  }

  @override
  Future<NetworkConnectivityResult> checkNetworkFirstTime() async {
    final connectivityResult = await (_connectivity.checkConnectivity());
    return checkConnectivityResult(connectivityResult);
  }

  @override
  void handleNetworkChange(NetworkCallBack onChange) {
    _subscription = _connectivity.onConnectivityChanged.listen((event) {
      onChange.call(checkConnectivityResult(event));
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
  }
}

/// It takes a ConnectivityResult and returns a NetworkConnectivityResult
///
/// Args:
///   result (ConnectivityResult): The result of the connectivity check.
///
/// Returns:
///   A Future<NetworkConnectivityResult>
NetworkConnectivityResult checkConnectivityResult(ConnectivityResult result) {
  switch (result) {
    case ConnectivityResult.bluetooth:
    case ConnectivityResult.wifi:
    case ConnectivityResult.ethernet:
    case ConnectivityResult.mobile:
      return NetworkConnectivityResult.online;
    case ConnectivityResult.none:
      return NetworkConnectivityResult.offline;
    default:
      throw ArgumentError('Unexpected ConnectivityResult: $result');
  }
}

