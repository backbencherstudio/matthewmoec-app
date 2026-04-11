import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matthewmoec_app/core/network/api_client.dart';
import 'package:matthewmoec_app/features/charity/domain/entities/charity_entity.dart';
import 'package:matthewmoec_app/features/home/data/datasources/home_remote_datasource.dart';
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

final getStoreDetailsProvider = FutureProvider.family<StoreEntity, String>((ref, slug) {
  return ref.read(_getStoreDetailsUseCaseProvider).call(slug);
});

final _getThisMonthCharitiesUseCaseProvider = Provider<GetThisMonthCharities>((ref) {
  return GetThisMonthCharities(ref.read(_homeRepositoryProvider));
});

final getThisMonthCharitiesProvider = FutureProvider<List<CharityEntity>>((ref) {
  return ref.read(_getThisMonthCharitiesUseCaseProvider).call();
});
