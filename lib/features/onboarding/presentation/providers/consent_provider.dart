import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _consentKey = 'has_accepted_consent';

final consentAcceptedProvider = StateProvider<bool>((ref) => false);

final consentStorageProvider = Provider<ConsentStorage>((ref) {
  return ConsentStorage();
});

class ConsentStorage {
  Future<bool> hasAcceptedConsent() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_consentKey) ?? false;
  }

  Future<void> setConsentAccepted(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_consentKey, value);
  }
}
