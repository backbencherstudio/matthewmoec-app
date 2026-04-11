import 'package:matthewmoec_app/features/app_config/data/datasources/app_remote_datasource.dart';
import 'package:matthewmoec_app/features/app_config/domain/entities/app_entity.dart';
import 'package:matthewmoec_app/features/app_config/domain/repositories/app_repository.dart';

class AppRepositoryImpl implements AppRepository {
  final AppRemoteDataSource _remoteDataSource;
  
  AppRepositoryImpl(this._remoteDataSource);
  
  @override
  Future<AppEntity> getAppConfig() {
    return _remoteDataSource.getAppConfig();
  }
}