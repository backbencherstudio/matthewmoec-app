import 'package:matthewmoec_app/features/charity/domain/entities/charity_entity.dart';

class CharityModel extends CharityEntity {
  CharityModel({
    super.id,
    super.charityOrganizationName,
    super.donationAmount,
    super.date,
  });

  CharityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    charityOrganizationName = json['charity_organization_name'];
    donationAmount = json['donation_amount'];
    date = json['date'] != null ? DateTime.parse(json['date']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['charity_organization_name'] = charityOrganizationName;
    data['donation_amount'] = donationAmount;
    data['date'] = date;
    return data;
  }

  static List<CharityModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CharityModel.fromJson(json)).toList();
  }
}
