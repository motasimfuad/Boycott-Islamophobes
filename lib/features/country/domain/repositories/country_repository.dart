import 'package:boycott_islamophobes/core/error/failures.dart';
import 'package:boycott_islamophobes/features/country/domain/entities/country_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CountryRepository {
  Future<Either<Failure, List<CountryEntity>>> getAllCountries();
  Future<Either<Failure, CountryEntity>> getCountry({required int id});
}
