import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:boycott_islamophobes/core/usecases/usecase.dart';
import 'package:boycott_islamophobes/features/company/domain/entities/company_entity.dart';
import 'package:boycott_islamophobes/features/company/domain/usecases/get_all_companies_usecase.dart';
import 'package:boycott_islamophobes/features/company/domain/usecases/get_company_usecase.dart';
import 'package:boycott_islamophobes/features/company/domain/usecases/get_filtered_companies_usecase.dart';

part 'company_event.dart';
part 'company_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  final GetAllCompaniesUsecase getCompanies;
  final GetCompanyUsecase getCompany;
  final GetFilteredCompaniesUsecase filteredCompanies;

  CompanyBloc({
    required this.getCompanies,
    required this.getCompany,
    required this.filteredCompanies,
  }) : super(CompanyInitial()) {
    on<CompanyEvent>((event, emit) async {
      // get all companies
      if (event is GetAllCompaniesEvent) {
        emit(CompanyListLoading());
        var either = await getCompanies(NoParams());
        either.fold(
          (l) => emit(CompanyListError(message: l.toString())),
          (r) => emit(CompanyListLoaded(companies: r)),
        );
      }

      // get company by id
      if (event is GetCompanyEvent) {
        emit(CompanyLoading());
        var either = await getCompany(Params(id: event.companyId));
        either.fold(
          (l) => emit(CompanyError(message: l.toString())),
          (r) => emit(CompanyLoaded(company: r)),
        );
      }

      // get filtered companies
      if (event is GetFilteredCompaniesEvent) {
        emit(FilteredCompanyListLoading());
        var either =
            await filteredCompanies(Params(countryId: event.countryId));
        either.fold(
          (l) => emit(FilteredCompanyListError(message: l.toString())),
          (r) => emit(FilteredCompanyListLoaded(companies: r)),
        );
      }
    });
  }
}
