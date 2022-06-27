import 'package:boycott_islamophobes/core/error/failures.dart';
import 'package:boycott_islamophobes/core/usecases/usecase.dart';
import 'package:boycott_islamophobes/features/country/domain/entities/country_entity.dart';
import 'package:boycott_islamophobes/features/country/domain/repositories/country_repository.dart';
import 'package:dartz/dartz.dart';

class GetCountry implements Usecase<CountryEntity, Params> {
  final CountryRepository countryRepository;
  GetCountry(this.countryRepository);

  @override
  Future<Either<Failure, CountryEntity>> call(Params params) async {
    return await countryRepository.getCountry(id: params.id!);
  }
}
