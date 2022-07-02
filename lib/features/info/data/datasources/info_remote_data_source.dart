import 'package:boycott_islamophobes/core/error/exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/info_model.dart';

abstract class InfoRemoteDataSource {
  Future<InfoModel> getAppInfo();
}

class InfoRemoteDataSourceImpl implements InfoRemoteDataSource {
  final FirebaseFirestore firestore;
  InfoRemoteDataSourceImpl(this.firestore);

  @override
  Future<InfoModel> getAppInfo() async {
    var infoData = await firestore.collection('app-info').doc('info').get();
    if (infoData.exists) {
      InfoModel info = InfoModel.fromMap(infoData.data()!);
      return info;
    } else {
      throw RemoteException();
    }
  }
}
