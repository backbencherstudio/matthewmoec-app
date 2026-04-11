import 'package:matthewmoec_app/features/charity/domain/entities/charity_entity.dart';
import 'package:matthewmoec_app/features/home/domain/repositories/home_repository.dart';

class GetThisMonthCharities {
  final HomeRepository _homeRepository;
  
  GetThisMonthCharities(this._homeRepository);
  
  Future<List<CharityEntity>> call() {
    return _homeRepository.getThisMonthCharities();
  }
}
