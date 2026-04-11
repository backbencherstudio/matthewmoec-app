import 'package:matthewmoec_app/features/charity/domain/entities/charity_entity.dart';
import 'package:matthewmoec_app/features/home/domain/entities/store_entity.dart';

abstract class HomeRepository {
  Future<List<StoreEntity>> getStores();
  Future<StoreEntity> getStoreBySlug(String slug);
  Future<List<CharityEntity>> getThisMonthCharities();
}