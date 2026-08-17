// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'CartForGood';

  @override
  String get tagline => 'Compre inteligentemente. Ahorre más. Contribuya.';

  @override
  String get backToStores => 'Volver a tiendas';

  @override
  String get backToCauses => 'Volver a las causas';

  @override
  String get helpOthers => 'Ayude a otros a comprar y contribuir';

  @override
  String get everyPurchase => 'Cada compra marca la diferencia';

  @override
  String get tapAStoreSupportsCharity => 'Toca una Tienda. Apoya la Caridad';

  @override
  String get shopNormallyHelpOthers => 'Shop normally. Help others.';

  @override
  String get helpOthersShopAndGiveBack =>
      'Ayude a otros a comprar y contribuir';

  @override
  String get search => 'Buscar';

  @override
  String get noStoresFound => 'No se encontraron tiendas';

  @override
  String get navHome => 'Inicio';

  @override
  String get navCharity => 'Caridad';

  @override
  String get navCauses => 'Causes';

  @override
  String get navShare => 'Compartir';

  @override
  String get howItWorksTitle => 'Cómo funciona';

  @override
  String get howItWorksDescription =>
      'Las tiendas nos pagan una pequeña comisión cuando compras a través de nuestros enlaces y completas tu compra en línea. No pagas nada extra. Compartimos una parte con organizaciones locales seleccionadas cada mes.';

  @override
  String get storeSelectionTitle => 'Compre en estas tiendas';

  @override
  String get amazonSubtext =>
      'Pida en línea. Recoja en tienda. La comisión sigue contando.';

  @override
  String get electronicsAndMore => 'Electrónica y más';

  @override
  String get homeAndFashion => 'Hogar y moda';

  @override
  String get opensInDeviceBrowser => 'Se abre en el navegador del dispositivo';

  @override
  String get opensInExternalBrowser =>
      'Se abre en navegador externo - NO WebView';

  @override
  String get storeLinkActive => 'Enlace de tienda activo';

  @override
  String get amazonAssociateDisclaimer =>
      'Como asociado de Amazon, percibo ingresos por compras elegibles.';

  @override
  String associateDisclaimer(String storeName) {
    return 'Como asociado de $storeName, percibo ingresos por compras elegibles.';
  }

  @override
  String get tapBelowAmazon =>
      'Toque abajo — Amazon se abre mediante un enlace de afiliado. Su compra apoya a la caridad sin costo adicional para usted.';

  @override
  String openStoreButton(String storeName) {
    return 'Abrir $storeName';
  }

  @override
  String get lastMonthDonationTitle => 'El mes pasado CartForGood donó';

  @override
  String get lastMonthConfirmedDonation => 'Donación confirmada del mes pasado';

  @override
  String get lastMonthShared => 'El mes pasado se compartió';

  @override
  String lastMonthDonationHome(String amount, String amount2) {
    return 'El mes pasado CartForGood donó \$$amount a Feeding America y \$$amount2 a Springfield Food Pantry.';
  }

  @override
  String donationSummary(String amount, String amount2) {
    return '$amount a Feeding America y $amount2 a Springfield Food Pantry.';
  }

  @override
  String get thisMonthsCharity => 'Caridad de este mes';

  @override
  String get thisMonthsCause => 'This month\'s cause';

  @override
  String trustSectionText(String charityName) {
    return 'Mismos precios. Mismo pago. La donación de este mes apoya a $charityName.';
  }

  @override
  String get shareAction => 'Compartir';

  @override
  String get shareNow => 'Compartir ahora';

  @override
  String get shareMessageTitle => 'Mensaje para compartir';

  @override
  String get defaultShareMessage =>
      'Uso CartForGood para comprar en Amazon, Walmart y más. Una parte va a la caridad automáticamente. Noviembre es Feeding America. Diciembre es Toys for Tots. Descarga gratuita. CartForGood.com';

  @override
  String get methodMessage => 'Mensaje';

  @override
  String get methodEmail => 'Correo';

  @override
  String get methodWhatsApp => 'WhatsApp';

  @override
  String get methodCopyLink => 'Copiar enlace';

  @override
  String get consentTitle => 'Bienvenido';

  @override
  String get consentPrivacyPolicy => 'Política de privacidad';

  @override
  String get consentTerms => 'Términos y condiciones';

  @override
  String get consentSupport => 'Soporte y preguntas frecuentes';

  @override
  String get consentAgreement =>
      'He leído y acepto la Política de Privacidad y los Términos y Condiciones.';

  @override
  String get consentNext => 'Siguiente';

  @override
  String get noInternetConnection => 'Sin conexión a internet';

  @override
  String get checkInternetMessage =>
      'Por favor verifique su red e intente nuevamente.';
}
