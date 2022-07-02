import 'package:boycott_islamophobes/core/error/exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/info_model.dart';

abstract class InfoRemoteDatasource {
  Future<InfoModel> getAppInfo();
}

class InfoRemoteDatasourceImpl implements InfoRemoteDatasource {
  final FirebaseFirestore firestore;
  InfoRemoteDatasourceImpl(this.firestore);

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
