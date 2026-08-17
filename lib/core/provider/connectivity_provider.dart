import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum NetworkStatus {
  connected,
  disconnected,
}

class ConnectivityNotifier extends StateNotifier<NetworkStatus> {
  final Connectivity _connectivity;
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  ConnectivityNotifier({Connectivity? connectivity})
      : _connectivity = connectivity ?? Connectivity(),
        super(NetworkStatus.connected) {
    _init();
  }

  Future<void> _init() async {
    try {
      final results = await _connectivity.checkConnectivity();
      _updateStatus(results);
    } catch (_) {
      // If platform channel not yet loaded (e.g. before full rebuild), default to connected
      state = NetworkStatus.connected;
    }

    try {
      _subscription = _connectivity.onConnectivityChanged
          .handleError((error) {
            // Silently suppress missing plugin during hot restart
          })
          .listen(
            _updateStatus,
            onError: (error) {
              // Silently suppress errors
            },
          );
    } catch (_) {
      // Platform channel not registered yet
    }
  }

  void _updateStatus(List<ConnectivityResult> results) {
    final isOffline = results.isEmpty ||
        results.every((result) => result == ConnectivityResult.none);

    final newStatus = isOffline ? NetworkStatus.disconnected : NetworkStatus.connected;
    if (state != newStatus) {
      state = newStatus;
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}

final connectivityStatusProvider =
    StateNotifierProvider<ConnectivityNotifier, NetworkStatus>((ref) {
  return ConnectivityNotifier();
});

final isConnectedProvider = Provider<bool>((ref) {
  final status = ref.watch(connectivityStatusProvider);
  return status == NetworkStatus.connected;
});
