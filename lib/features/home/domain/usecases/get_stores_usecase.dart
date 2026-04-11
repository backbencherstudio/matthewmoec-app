import 'package:matthewmoec_app/features/home/domain/entities/store_entity.dart';
import 'package:matthewmoec_app/features/home/domain/repositories/home_repository.dart';

class GetStoresUseCase {
  final HomeRepository _homeRepository;
  
  GetStoresUseCase(this._homeRepository);
  
  Future<List<StoreEntity>> call() {
    return _homeRepository.getStores();
  }
}