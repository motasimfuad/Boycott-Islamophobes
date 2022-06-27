import 'package:boycott_islamophobes/core/error/exceptions.dart';
import 'package:boycott_islamophobes/features/country/data/models/country_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class CountryRemoteDataSource {
  Future<List<CountryModel>> getAllCountries();
  Future<CountryModel> getCountry(int id);
}

class CountryRemoteDataSourceImpl implements CountryRemoteDataSource {
  final FirebaseFirestore firestore;
  CountryRemoteDataSourceImpl(this.firestore);

  @override
  Future<List<CountryModel>> getAllCountries() async {
    var countryCollection = await firestore.collection('countries').get();

    List<CountryModel> countryList = countryCollection.docs
        .map((e) => CountryModel.fromMap(e.data()))
        .toList();
    return countryList;
  }

  @override
  Future<CountryModel> getCountry(int id) async {
    var countryCollection = await firestore
        .collection('countries')
        .where('id', isEqualTo: id)
        .get();
    if (countryCollection.docs.isNotEmpty) {
      CountryModel countryModel =
          CountryModel.fromMap(countryCollection.docs.first.data());
      return countryModel;
    } else {
      throw RemoteException();
    }
  }
}
