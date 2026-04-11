import 'package:matthewmoec_app/core/network/api_client.dart';
import 'package:matthewmoec_app/core/network/api_endpoint.dart';
import 'package:matthewmoec_app/features/charity/data/models/charity_model.dart';
import 'package:matthewmoec_app/features/home/data/models/store_model.dart';
import 'package:matthewmoec_app/features/charity/domain/entities/charity_entity.dart';
import 'package:matthewmoec_app/features/home/domain/entities/store_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<StoreEntity>> getStores();
  Future<StoreEntity> getStoreDetails(String? idOrSlug);
  Future<List<CharityEntity>> getThisMonthCharities();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClient _apiClient;

  HomeRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<StoreModel>> getStores() async {
    try {
      final response = await _apiClient.get(ApiEndpoint.stores);
      return StoreModel.fromJsonList(response['data']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<StoreEntity> getStoreDetails(String? idOrSlug) async {
    try {
      final response = await _apiClient.get(ApiEndpoint.storeById(idOrSlug));
      return StoreModel.fromJson(response['data']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CharityEntity>> getThisMonthCharities() async {
    try {
      final response = await _apiClient.get(ApiEndpoint.charityThisMonth);
      return CharityModel.fromJsonList(response['data']);
    } catch (e) {
      rethrow;
    }
  }
}
