import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localeProvider = NotifierProvider<LocaleNotifier, Locale>(() {
  return LocaleNotifier();
});

class LocaleNotifier extends Notifier<Locale> {
  @override
  Locale build() {
    return const Locale('en');
  }

  // Update Riverpod state (Call this AFTER context.setLocale in the UI)
  void updateLocale(Locale newLocale) {
    state = newLocale;
  }
}