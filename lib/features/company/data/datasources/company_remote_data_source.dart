import 'package:boycott_islamophobes/core/error/exceptions.dart';
import 'package:boycott_islamophobes/features/company/data/models/company_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class CompanyRemoteDataSource {
  Future<List<CompanyModel>> getAllCompanies();
  Future<CompanyModel> getCompany(int id);
  Future<List<CompanyModel>> getFilteredCompanies(int countryId);
}

class CompanyRemoteDataSourceImpl implements CompanyRemoteDataSource {
  final FirebaseFirestore firestore;
  CompanyRemoteDataSourceImpl(this.firestore);

  @override
  Future<List<CompanyModel>> getAllCompanies() async {
    final companyCollection = await firestore.collection('companies').get();
    List<CompanyModel> companyList = companyCollection.docs
        .map((e) => CompanyModel.fromMap(e.data()))
        .toList();
    return companyList;
  }

  @override
  Future<CompanyModel> getCompany(int id) async {
    final companyCollection = await firestore
        .collection('companies')
        .where('id', isEqualTo: id)
        .get();

    if (companyCollection.docs.isNotEmpty) {
      CompanyModel company =
          CompanyModel.fromMap(companyCollection.docs.first.data());
      return company;
    } else {
      throw RemoteException();
    }
  }

  @override
  Future<List<CompanyModel>> getFilteredCompanies(int countryId) async {
    final companiesCollection = await firestore
        .collection('companies')
        .where('countryId', isEqualTo: countryId)
        .get();

    if (companiesCollection.docs.isNotEmpty) {
      List<CompanyModel> companies = companiesCollection.docs
          .map((e) => CompanyModel.fromMap(e.data()))
          .toList();
      return companies;
    } else {
      throw RemoteException();
    }
  }
}
