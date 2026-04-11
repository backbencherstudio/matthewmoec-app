import 'package:matthewmoec_app/features/home/domain/entities/store_entity.dart';

class StoreModel extends StoreEntity {
  StoreModel({
    super.id,
    super.name,
    super.slug,
    super.link,
    super.subTextNote,
    super.howItWorks,
    super.logo,
    super.logoUrl,
  });

  StoreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    link = json['link'];
    subTextNote = json['sub_text_note'];
    howItWorks = json['how_it_works'];
    logo = json['logo'];
    logoUrl = json['logo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['link'] = link;
    data['sub_text_note'] = subTextNote;
    data['how_it_works'] = howItWorks;
    data['logo'] = logo;
    data['logo_url'] = logoUrl;
    return data;
  }

  static List<StoreModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => StoreModel.fromJson(json)).toList();
  }
}
