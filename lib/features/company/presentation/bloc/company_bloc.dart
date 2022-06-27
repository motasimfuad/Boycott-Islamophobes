import 'package:bloc/bloc.dart';
import 'package:boycott_islamophobes/core/usecases/usecase.dart';
import 'package:boycott_islamophobes/features/company/domain/entities/company_entity.dart';
import 'package:boycott_islamophobes/features/company/domain/usecases/get_all_companies_usecase.dart';
import 'package:boycott_islamophobes/features/company/domain/usecases/get_company_usecase.dart';
import 'package:equatable/equatable.dart';

part 'company_event.dart';
part 'company_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  final GetAllCompaniesUsecase getCompanies;
  final GetCompanyUsecase getCompany;

  CompanyBloc({
    required this.getCompanies,
    required this.getCompany,
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
    });
  }
}
