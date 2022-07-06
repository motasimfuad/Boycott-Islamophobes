part of 'company_bloc.dart';

abstract class CompanyState extends Equatable {
  const CompanyState();

  @override
  List<Object> get props => [];
}

class CompanyInitial extends CompanyState {}

class CompanyListLoading extends CompanyState {}

class CompanyListError extends CompanyState {
  final String message;
  const CompanyListError({required this.message});

  @override
  List<Object> get props => [message];
}

class CompanyListLoaded extends CompanyState {
  final List<CompanyEntity> companies;
  const CompanyListLoaded({required this.companies});

  @override
  List<Object> get props => [companies];
}

class CompanyLoading extends CompanyState {}

class CompanyError extends CompanyState {
  final String message;
  const CompanyError({required this.message});

  @override
  List<Object> get props => [message];
}

class CompanyLoaded extends CompanyState {
  final CompanyEntity company;
  const CompanyLoaded({required this.company});

  @override
  List<Object> get props => [company];
}

class FilteredCompanyListLoading extends CompanyState {}

class FilteredCompanyListError extends CompanyState {
  final String message;
  const FilteredCompanyListError({required this.message});

  @override
  List<Object> get props => [message];
}

class FilteredCompanyListLoaded extends CompanyState {
  final List<CompanyEntity> companies;
  const FilteredCompanyListLoaded({required this.companies});

  @override
  List<Object> get props => [companies];
}
