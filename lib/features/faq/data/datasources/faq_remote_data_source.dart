import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:boycott_islamophobes/features/faq/data/models/faq_model.dart';

abstract class FaqRemoteDataSource {
  Future<List<FaqModel>> getAllFaqs();
}

class FaqRemoteDataSourceImpl implements FaqRemoteDataSource {
  final FirebaseFirestore firestore;
  FaqRemoteDataSourceImpl({
    required this.firestore,
  });

  @override
  Future<List<FaqModel>> getAllFaqs() async {
    var faqCollection = await firestore.collection('faqs').get();
    List<FaqModel> faqList =
        faqCollection.docs.map((e) => FaqModel.fromMap(e.data())).toList();
    return faqList;
  }
}
