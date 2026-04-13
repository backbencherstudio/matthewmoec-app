import 'package:matthewmoec_app/core/provider/provider.dart';
import 'package:matthewmoec_app/core/translate/translation_service.dart';
import 'package:matthewmoec_app/features/app_config/data/datasources/app_remote_datasource.dart';
import 'package:matthewmoec_app/core/network/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matthewmoec_app/features/app_config/data/models/app_model.dart';
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

final translatedAppConfigProvider = FutureProvider<AppModel>((ref) async {
  final appConfigEntity = await ref.watch(getAppConfigProvider.future);
  final originalAppConfig = appConfigEntity as AppModel;
  final locale = ref.watch(localeProvider); // Watches your Notifier
  final service = ref.read(translationServiceProvider);

  if (locale.languageCode == 'en') return originalAppConfig;

  final translatedName = await service.translate(
    originalAppConfig.appName!,
    locale.languageCode,
  );
  final translatedMessageHomePage = await service.translate(
    originalAppConfig.messageHomePage!,
    locale.languageCode,
  );
  final translatedShareMessage = await service.translate(
    originalAppConfig.shareMessage!,
    locale.languageCode,
  );
  final translatedHowItWorks = await service.translate(
    originalAppConfig.howItWorks!,
    locale.languageCode,
  );

  return originalAppConfig.copyWith(
    appName: translatedName,
    messageHomePage: translatedMessageHomePage,
    shareMessage: translatedShareMessage,
    howItWorks: translatedHowItWorks,
  );
});
