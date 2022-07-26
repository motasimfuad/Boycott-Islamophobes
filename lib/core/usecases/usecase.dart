import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../constants/enums.dart';
import '../error/failures.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class Params extends Equatable {
  final int? id;
  final int? categoryId;
  final int? countryId;
  final String? searchText;
  final ProductFilterType? filterType;
  const Params({
    this.id,
    this.categoryId,
    this.countryId,
    this.searchText,
    this.filterType,
  });
  @override
  List<Object> get props => [];
}
