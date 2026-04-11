import 'package:matthewmoec_app/features/charity/data/datasources/charity_remote_datasource.dart';
import 'package:matthewmoec_app/features/charity/domain/entities/charity_entity.dart';
import 'package:matthewmoec_app/features/charity/domain/repositories/charity_repository.dart';

class CharityRepositoryImpl implements CharityRepository {
  final CharityRemoteDataSource _remoteDataSource;
  
  CharityRepositoryImpl(this._remoteDataSource);
  
  @override
  Future<List<CharityEntity>> getLastMonthCharities() {
    return _remoteDataSource.getLastMonthCharities();
  }
}