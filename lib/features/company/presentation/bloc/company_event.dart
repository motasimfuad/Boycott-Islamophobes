part of 'company_bloc.dart';

abstract class CompanyEvent extends Equatable {
  const CompanyEvent();

  @override
  List<Object> get props => [];
}

class GetAllCompaniesEvent extends CompanyEvent {}

class GetCompanyEvent extends CompanyEvent {
  final int companyId;
  const GetCompanyEvent({required this.companyId});

  @override
  List<Object> get props => [companyId];
}
