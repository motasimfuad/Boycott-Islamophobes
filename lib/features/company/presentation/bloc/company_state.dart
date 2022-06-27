part of 'company_bloc.dart';

abstract class CompanyState extends Equatable {
  const CompanyState();  

  @override
  List<Object> get props => [];
}
class CompanyInitial extends CompanyState {}
