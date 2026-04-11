import 'package:matthewmoec_app/features/app_config/data/datasources/app_remote_datasource.dart';
import 'package:matthewmoec_app/core/network/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matthewmoec_app/features/app_config/data/repositories/app_repository_impl.dart';
import 'package:matthewmoec_app/features/app_config/domain/entities/app_entity.dart';
import 'package:matthewmoec_app/features/app_config/domain/repositories/app_repository.dart';
import 'package:matthewmoec_app/features/app_config/domain/usecases/get_app_config_usecase.dart';

final _apiClientProvider = Provider<ApiClient>((ref) => ApiClient());

final _appRemoteDatasourceProvider = Provider<AppRemoteDataSource>((ref) {
  return AppRemoteDataSourceImpl(ref.read(_apiClientProvider));
});

final _appRepositoryProvider = Provider<AppRepository>((ref) {
  return AppRepositoryImpl(ref.read(_appRemoteDatasourceProvider));
});

final _getAppConfigUseCaseProvider = Provider<GetAppConfigUsecase>((ref) {
  return GetAppConfigUsecase(ref.read(_appRepositoryProvider));
});

final getAppConfigProvider = FutureProvider<AppEntity>((ref) {
  return ref.read(_getAppConfigUseCaseProvider)();
});