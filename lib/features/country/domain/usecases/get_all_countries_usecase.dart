import 'package:boycott_islamophobes/core/error/failures.dart';
import 'package:boycott_islamophobes/core/usecases/usecase.dart';
import 'package:boycott_islamophobes/features/country/domain/entities/country_entity.dart';
import 'package:boycott_islamophobes/features/country/domain/repositories/country_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllCountriesUsecase implements Usecase<List<CountryEntity>, NoParams> {
  final CountryRepository countryRepository;
  GetAllCountriesUsecase(this.countryRepository);

  @override
  Future<Either<Failure, List<CountryEntity>>> call(NoParams params) async {
    return await countryRepository.getAllCountries();
  }
}
