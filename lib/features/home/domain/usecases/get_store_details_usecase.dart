import 'package:matthewmoec_app/features/home/domain/entities/store_entity.dart';
import 'package:matthewmoec_app/features/home/domain/repositories/home_repository.dart';

class GetStoreDetailsUsecase {
  final HomeRepository _homeRepository;
  
  GetStoreDetailsUsecase(this._homeRepository);
  
  Future<StoreEntity> call(String slug) {
    return _homeRepository.getStoreBySlug(slug);
  }
}