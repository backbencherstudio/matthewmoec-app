import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashProvider = StateNotifierProvider<SplashNotifier, double>((ref) {
  return SplashNotifier();
});

class SplashNotifier extends StateNotifier<double> {
  SplashNotifier() : super(0.0);

  void updateProgress(double value) {
    state = value;
  }
}