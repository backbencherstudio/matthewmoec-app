import 'package:matthewmoec_app/features/charity/domain/entities/charity_entity.dart';
import 'package:matthewmoec_app/features/charity/domain/repositories/charity_repository.dart';

class GetLastMonthCharitiesUsecase {
  final CharityRepository _charityRepository;
  
  GetLastMonthCharitiesUsecase(this._charityRepository);
  
  Future<List<CharityEntity>> call() {
    return _charityRepository.getLastMonthCharities();
  }
}