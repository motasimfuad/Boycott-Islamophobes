import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

//! check if the usecase is called with the correct params
class Params extends Equatable {
  final int? id;
  final String? searchText;
  const Params({
    this.id,
    this.searchText,
  });
  @override
  List<Object> get props => [];
}
