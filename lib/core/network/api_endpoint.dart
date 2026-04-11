import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoint {
  static String get baseUrl => dotenv.env['API_BASE_URL'] ?? '';

  static String get stores => '$baseUrl/store'; // Get
  static String storeById(String? idOrSlug) => '$baseUrl/store/$idOrSlug'; // Get
  static String storeClick(String? idOrSlug) => '$baseUrl/store/$idOrSlug/clicks'; // Post

  static String get appConfiguration => '$baseUrl/app-configuration'; // Get

  static String get initTracking => '$baseUrl/analytics/init-tracking'; // Get
  static String get shareClick => '$baseUrl/analytics/share-click'; // Post

  static String get charityThisMonth => '$baseUrl/charity/this-month'; // Get
  static String get charityLastMonth => '$baseUrl/charity/last-month'; // Get
}
