import 'package:matthewmoec_app/features/app_config/domain/entities/app_entity.dart';

class AppModel extends AppEntity {
  AppModel({
    super.id,
    super.createdAt,
    super.updatedAt,
    super.shareMessage,
    super.messageHomePage,
    super.howItWorks,
    super.appName,
    super.totalLastMonthDonationAmount,
    super.iosAppStoreUrl,
    super.androidPlayStoreUrl,
  });

  AppModel copyWith({
  String? id,
  String? createdAt,
  String? updatedAt,
  String? shareMessage,
  String? messageHomePage,
  String? howItWorks,
  String? appName,
  String? totalLastMonthDonationAmount,
  String? iosAppStoreUrl,
  String? androidPlayStoreUrl,
  }) {
    return AppModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      shareMessage: shareMessage ?? this.shareMessage,
      messageHomePage: messageHomePage ?? this.messageHomePage,
      howItWorks: howItWorks ?? this.howItWorks,
      appName: appName ?? this.appName,
      totalLastMonthDonationAmount: totalLastMonthDonationAmount ?? this.totalLastMonthDonationAmount,
      iosAppStoreUrl: iosAppStoreUrl ?? this.iosAppStoreUrl,
      androidPlayStoreUrl: androidPlayStoreUrl ?? this.androidPlayStoreUrl,
    );
  }
    

  AppModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shareMessage = json['share_message'];
    messageHomePage = json['message_home_page'];
    howItWorks = json['how_it_works'];
    appName = json['app_name'];
    totalLastMonthDonationAmount = json['total_last_month_donation_amount'];
    iosAppStoreUrl = json['ios_app_store_url'];
    androidPlayStoreUrl = json['android_play_store_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['share_message'] = shareMessage;
    data['message_home_page'] = messageHomePage;
    data['how_it_works'] = howItWorks;
    data['app_name'] = appName;
    data['total_last_month_donation_amount'] =
        totalLastMonthDonationAmount;
    data['ios_app_store_url'] = iosAppStoreUrl;
    data['android_play_store_url'] = androidPlayStoreUrl;
    return data;
  }

}