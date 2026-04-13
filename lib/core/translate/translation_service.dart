import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class TranslationService {
  Future<String> translate(String text, String targetLanguageCode) async {
    final translator = OnDeviceTranslator(
      sourceLanguage: TranslateLanguage.english,
      targetLanguage: TranslateLanguage.spanish,
    );

    try {
      return await translator.translateText(text);
    } finally {
      translator.close();
    }
  }
}

final translationServiceProvider = Provider((ref) => TranslationService());