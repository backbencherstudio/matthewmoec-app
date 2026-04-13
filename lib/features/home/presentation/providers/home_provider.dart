import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matthewmoec_app/core/network/api_client.dart';
import 'package:matthewmoec_app/core/provider/provider.dart';
import 'package:matthewmoec_app/core/translate/translation_service.dart';
import 'package:matthewmoec_app/features/charity/domain/entities/charity_entity.dart';
import 'package:matthewmoec_app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:matthewmoec_app/features/home/data/models/store_model.dart';
import 'package:matthewmoec_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:matthewmoec_app/features/home/domain/entities/store_entity.dart';
import 'package:matthewmoec_app/features/home/domain/repositories/home_repository.dart';
import 'package:matthewmoec_app/features/home/domain/usecases/get_store_details_usecase.dart';
import 'package:matthewmoec_app/features/home/domain/usecases/get_stores_usecase.dart';
import 'package:matthewmoec_app/features/home/domain/usecases/get_this_month_charities.dart';

final _apiClientProvider = Provider<ApiClient>((ref) => ApiClient());

final _homeRemoteDatasourceProvider = Provider<HomeRemoteDataSource>((ref) {
  return HomeRemoteDataSourceImpl(ref.read(_apiClientProvider));
});

final _homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepositoryImpl(ref.read(_homeRemoteDatasourceProvider));
});

final _getStoresUseCaseProvider = Provider<GetStoresUseCase>((ref) {
  return GetStoresUseCase(ref.read(_homeRepositoryProvider));
});

final _getStoreDetailsUseCaseProvider = Provider<GetStoreDetailsUsecase>(
  (ref) => GetStoreDetailsUsecase(ref.read(_homeRepositoryProvider)),
);

final getStoresProvider = FutureProvider<List<StoreEntity>>((ref) {
  return ref.read(_getStoresUseCaseProvider).call();
});

final translatedStoresProvider = FutureProvider<List<StoreModel>>((ref) async {
  final storesList = await ref.watch(getStoresProvider.future);
  final locale = ref.watch(localeProvider); // Watches your Notifier
  final service = ref.read(translationServiceProvider);

  if (locale.languageCode == 'en') {
    return storesList.map((e) => e as StoreModel).toList();
  }

  final translatedStores = <StoreModel>[];

  for (final storeEntity in storesList) {
    final originalStore = storeEntity as StoreModel;

    final translatedName = await service.translate(
      originalStore.name!,
      locale.languageCode,
    );
    final translatedSubTextNote = await service.translate(
      originalStore.subTextNote!,
      locale.languageCode,
    );

    translatedStores.add(
      originalStore.copyWith(
        name: translatedName,
        subTextNote: translatedSubTextNote,
      ),
    );
  }

  return translatedStores;
});

final getStoreDetailsProvider = FutureProvider.family<StoreEntity, String>((
  ref,
  slug,
) {
  return ref.read(_getStoreDetailsUseCaseProvider).call(slug);
});

final _getThisMonthCharitiesUseCaseProvider = Provider<GetThisMonthCharities>((
  ref,
) {
  return GetThisMonthCharities(ref.read(_homeRepositoryProvider));
});

final getThisMonthCharitiesProvider = FutureProvider<List<CharityEntity>>((
  ref,
) {
  return ref.read(_getThisMonthCharitiesUseCaseProvider).call();
});

final translatedStoreProvider = FutureProvider.family<StoreModel, String>((
  ref,
  slug,
) async {
  final storeEntity = await ref.watch(getStoreDetailsProvider(slug).future);
  final originalStore = storeEntity as StoreModel;
  final locale = ref.watch(localeProvider); // Watches your Notifier
  final service = ref.read(translationServiceProvider);

  if (locale.languageCode == 'en') return originalStore;

  final translatedSubTextNote = await service.translate(
    originalStore.subTextNote!,
    locale.languageCode,
  );
  final translatedHowItWorks = await service.translate(
    originalStore.howItWorks!,
    locale.languageCode,
  );

  return originalStore.copyWith(
    subTextNote: translatedSubTextNote,
    howItWorks: translatedHowItWorks,
  );
});
