import 'package:matthewmoec_app/features/charity/domain/entities/charity_entity.dart';
import 'package:matthewmoec_app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:matthewmoec_app/features/home/domain/entities/store_entity.dart';
import 'package:matthewmoec_app/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  
  final HomeRemoteDataSource _homeRemoteDataSource;
  
  HomeRepositoryImpl(this._homeRemoteDataSource);
  
  @override
  Future<List<StoreEntity>> getStores() {
    return _homeRemoteDataSource.getStores();
  }
  
  @override
  Future<StoreEntity> getStoreBySlug(String slug) {
    return _homeRemoteDataSource.getStoreDetails(slug);
  }
  
  @override
  Future<List<CharityEntity>> getThisMonthCharities() {
    return _homeRemoteDataSource.getThisMonthCharities();
  }
}
