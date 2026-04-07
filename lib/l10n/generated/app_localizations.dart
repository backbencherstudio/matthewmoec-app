import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'CartForGood'**
  String get appName;

  /// No description provided for @tagline.
  ///
  /// In en, this message translates to:
  /// **'Shop Smart. Save More. Give Back.'**
  String get tagline;

  /// No description provided for @backToStores.
  ///
  /// In en, this message translates to:
  /// **'Back to stores'**
  String get backToStores;

  /// No description provided for @backToCharity.
  ///
  /// In en, this message translates to:
  /// **'Back to charity'**
  String get backToCharity;

  /// No description provided for @helpOthers.
  ///
  /// In en, this message translates to:
  /// **'Help Others shop & give back'**
  String get helpOthers;

  /// No description provided for @everyPurchase.
  ///
  /// In en, this message translates to:
  /// **'Every purchase makes a difference'**
  String get everyPurchase;

  /// No description provided for @tapAStoreSupportsCharity.
  ///
  /// In en, this message translates to:
  /// **'Tap a Store. Supports Charity'**
  String get tapAStoreSupportsCharity;

  /// No description provided for @helpOthersShopAndGiveBack.
  ///
  /// In en, this message translates to:
  /// **'Help Others shop & give back'**
  String get helpOthersShopAndGiveBack;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navCharity.
  ///
  /// In en, this message translates to:
  /// **'Charity'**
  String get navCharity;

  /// No description provided for @navShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get navShare;

  /// No description provided for @howItWorksTitle.
  ///
  /// In en, this message translates to:
  /// **'How It works'**
  String get howItWorksTitle;

  /// No description provided for @howItWorksDescription.
  ///
  /// In en, this message translates to:
  /// **'The stores pay us a small commission when you shop through our links. You pay nothing extra. We share what they give us with charity every month.'**
  String get howItWorksDescription;

  /// No description provided for @storeSelectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Shop at these Stores'**
  String get storeSelectionTitle;

  /// No description provided for @amazonSubtext.
  ///
  /// In en, this message translates to:
  /// **'Order online. Pick up in store. Commission still counts.'**
  String get amazonSubtext;

  /// No description provided for @electronicsAndMore.
  ///
  /// In en, this message translates to:
  /// **'Electronics & more'**
  String get electronicsAndMore;

  /// No description provided for @homeAndFashion.
  ///
  /// In en, this message translates to:
  /// **'Home & Fashion'**
  String get homeAndFashion;

  /// No description provided for @opensInDeviceBrowser.
  ///
  /// In en, this message translates to:
  /// **'Opens in device browser'**
  String get opensInDeviceBrowser;

  /// No description provided for @opensInExternalBrowser.
  ///
  /// In en, this message translates to:
  /// **'Opens in external browser - NOT WebView'**
  String get opensInExternalBrowser;

  /// No description provided for @storeLinkActive.
  ///
  /// In en, this message translates to:
  /// **'Store Link Active'**
  String get storeLinkActive;

  /// No description provided for @amazonAssociateDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'As an Amazon Associate I earn from qualifying purchases.'**
  String get amazonAssociateDisclaimer;

  /// No description provided for @tapBelowAmazon.
  ///
  /// In en, this message translates to:
  /// **'Tap below — Amazon opens via affiliate link. Your purchase supports charity at no extra cost to you.'**
  String get tapBelowAmazon;

  /// No description provided for @openStoreButton.
  ///
  /// In en, this message translates to:
  /// **'Open {storeName}'**
  String openStoreButton(String storeName);

  /// No description provided for @lastMonthDonationTitle.
  ///
  /// In en, this message translates to:
  /// **'Last month CartForGood donated'**
  String get lastMonthDonationTitle;

  /// No description provided for @lastMonthConfirmedDonation.
  ///
  /// In en, this message translates to:
  /// **'Last month confirmed donation'**
  String get lastMonthConfirmedDonation;

  /// No description provided for @lastMonthDonationHome.
  ///
  /// In en, this message translates to:
  /// **'Last month CartForGood donated \${amount} to Feeding America and \${amount2} to Springfield Food Pantry.'**
  String lastMonthDonationHome(String amount, String amount2);

  /// No description provided for @donationSummary.
  ///
  /// In en, this message translates to:
  /// **'\${amount} to Feeding America and \${amount2} to Springfield Food Pantry.'**
  String donationSummary(String amount, String amount2);

  /// No description provided for @thisMonthsCharity.
  ///
  /// In en, this message translates to:
  /// **'This month\'s charity'**
  String get thisMonthsCharity;

  /// No description provided for @shareAction.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get shareAction;

  /// No description provided for @shareNow.
  ///
  /// In en, this message translates to:
  /// **'Share Now'**
  String get shareNow;

  /// No description provided for @shareMessageTitle.
  ///
  /// In en, this message translates to:
  /// **'Share Message'**
  String get shareMessageTitle;

  /// No description provided for @defaultShareMessage.
  ///
  /// In en, this message translates to:
  /// **'I use CartForGood to shop at Amazon, Walmart and more. A portion goes to charity automatically. November is Feeding America. December is Toys for Tots. Free to download. CartForGood.com'**
  String get defaultShareMessage;

  /// No description provided for @methodMessage.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get methodMessage;

  /// No description provided for @methodEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get methodEmail;

  /// No description provided for @methodWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp'**
  String get methodWhatsApp;

  /// No description provided for @methodCopyLink.
  ///
  /// In en, this message translates to:
  /// **'Copy Link'**
  String get methodCopyLink;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
