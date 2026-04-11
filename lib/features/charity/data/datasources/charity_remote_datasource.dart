import 'package:matthewmoec_app/core/network/api_client.dart';
import 'package:matthewmoec_app/core/network/api_endpoint.dart';
import 'package:matthewmoec_app/features/charity/data/models/charity_model.dart';
import 'package:matthewmoec_app/features/charity/domain/entities/charity_entity.dart';

abstract class CharityRemoteDataSource {
  Future<List<CharityEntity>> getLastMonthCharities();
}

class CharityRemoteDataSourceImpl implements CharityRemoteDataSource {
  final ApiClient _apiClient;
  
  CharityRemoteDataSourceImpl(this._apiClient);
  
  @override
  Future<List<CharityEntity>> getLastMonthCharities() async {
    try{
      final response = await _apiClient.get(ApiEndpoint.charityLastMonth);
      return CharityModel.fromJsonList(response['data']);
    } catch (e) {
      rethrow;
    }
  }
}
