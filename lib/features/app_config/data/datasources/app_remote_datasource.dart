import 'package:matthewmoec_app/core/network/api_client.dart';
import 'package:matthewmoec_app/core/network/api_endpoint.dart';
import 'package:matthewmoec_app/features/app_config/data/models/app_model.dart';
import 'package:matthewmoec_app/features/app_config/domain/entities/app_entity.dart';

abstract class AppRemoteDataSource {
  Future<AppEntity> getAppConfig();
}

class AppRemoteDataSourceImpl implements AppRemoteDataSource {
  final ApiClient _apiClient;
  
  AppRemoteDataSourceImpl(this._apiClient);
  
  @override
  Future<AppEntity> getAppConfig() async {
    final response = await _apiClient.get(ApiEndpoint.appConfiguration);
    return AppModel.fromJson(response['data']);
  }
}
