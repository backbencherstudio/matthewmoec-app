// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'CartForGood';

  @override
  String get tagline => 'Shop Smart. Save More. Give Back.';

  @override
  String get backToStores => 'Back to stores';

  @override
  String get backToCharity => 'Back to charity';

  @override
  String get helpOthers => 'Help Others shop & give back';

  @override
  String get everyPurchase => 'Every purchase makes a difference';

  @override
  String get tapAStoreSupportsCharity => 'Tap a Store. Supports Charity';

  @override
  String get helpOthersShopAndGiveBack => 'Help Others shop & give back';

  @override
  String get navHome => 'Home';

  @override
  String get navCharity => 'Charity';

  @override
  String get navShare => 'Share';

  @override
  String get howItWorksTitle => 'How It works';

  @override
  String get howItWorksDescription =>
      'The stores pay us a small commission when you shop through our links. You pay nothing extra. We share what they give us with charity every month.';

  @override
  String get storeSelectionTitle => 'Shop at these Stores';

  @override
  String get amazonSubtext =>
      'Order online. Pick up in store. Commission still counts.';

  @override
  String get electronicsAndMore => 'Electronics & more';

  @override
  String get homeAndFashion => 'Home & Fashion';

  @override
  String get opensInDeviceBrowser => 'Opens in device browser';

  @override
  String get opensInExternalBrowser =>
      'Opens in external browser - NOT WebView';

  @override
  String get storeLinkActive => 'Store Link Active';

  @override
  String get amazonAssociateDisclaimer =>
      'As an Amazon Associate I earn from qualifying purchases.';

  @override
  String get tapBelowAmazon =>
      'Tap below — Amazon opens via affiliate link. Your purchase supports charity at no extra cost to you.';

  @override
  String openStoreButton(String storeName) {
    return 'Open $storeName';
  }

  @override
  String get lastMonthDonationTitle => 'Last month CartForGood donated';

  @override
  String get lastMonthConfirmedDonation => 'Last month confirmed donation';

  @override
  String lastMonthDonationHome(String amount, String amount2) {
    return 'Last month CartForGood donated \$$amount to Feeding America and \$$amount2 to Springfield Food Pantry.';
  }

  @override
  String donationSummary(String amount, String amount2) {
    return '\$$amount to Feeding America and \$$amount2 to Springfield Food Pantry.';
  }

  @override
  String get thisMonthsCharity => 'This month\'s charity';

  @override
  String get shareAction => 'Share';

  @override
  String get shareNow => 'Share Now';

  @override
  String get shareMessageTitle => 'Share Message';

  @override
  String get defaultShareMessage =>
      'I use CartForGood to shop at Amazon, Walmart and more. A portion goes to charity automatically. November is Feeding America. December is Toys for Tots. Free to download. CartForGood.com';

  @override
  String get methodMessage => 'Message';

  @override
  String get methodEmail => 'Email';

  @override
  String get methodWhatsApp => 'WhatsApp';

  @override
  String get methodCopyLink => 'Copy Link';
}
