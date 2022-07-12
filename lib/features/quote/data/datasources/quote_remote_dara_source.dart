import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/quote_model.dart';

abstract class QuoteRemoteDataSource {
  Future<List<QuoteModel>> getAllQuotes();
}

class QuoteRemoteDataSourceImpl implements QuoteRemoteDataSource {
  final FirebaseFirestore firestore;
  QuoteRemoteDataSourceImpl(this.firestore);

  @override
  Future<List<QuoteModel>> getAllQuotes() async {
    final quoteCollection =
        await firestore.collection('quotes').orderBy('id').get();
    List<QuoteModel> quoteList =
        quoteCollection.docs.map((e) => QuoteModel.fromMap(e.data())).toList();
    return quoteList;
  }
}
