import 'package:boycott_islamophobes/features/product/data/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/error/exceptions.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getProduct(int id);
  Future<List<ProductModel>> getFilteredProducts({
    int? categoryId,
    int? countryId,
    String? searchText,
  });
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final FirebaseFirestore firestore;
  ProductRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<ProductModel>> getAllProducts() async {
    var prodCollection = await firestore.collection('products').get();
    List<ProductModel> productList = prodCollection.docs
        .map((product) => ProductModel.fromMap(product.data()))
        .toList();
    return productList;
  }

  @override
  Future<ProductModel> getProduct(int id) async {
    var products =
        await firestore.collection('products').where('id', isEqualTo: id).get();
    if (products.docs.isNotEmpty) {
      return ProductModel.fromMap(products.docs.first.data());
    } else {
      throw RemoteException();
    }
  }

  @override
  Future<List<ProductModel>> getFilteredProducts({
    int? categoryId,
    int? countryId,
    String? searchText,
  }) async {
    QuerySnapshot<Map<String, dynamic>> products;
    if (searchText != null && categoryId == null && countryId == null) {
      products = await firestore
          .collection('products')
          .where(
            'name',
            isGreaterThanOrEqualTo: searchText.toLowerCase(),
            isLessThan: searchText
                    .toLowerCase()
                    .substring(0, searchText.length - 1) +
                String.fromCharCode(
                    searchText.toLowerCase().codeUnitAt(searchText.length - 1) +
                        1),
          )
          .get();
    } else if (categoryId != null && searchText == null && countryId == null) {
      products = await firestore
          .collection('products')
          .where('categoryId', isEqualTo: categoryId)
          .get();
    } else {
      products = await firestore
          .collection('products')
          .where('countryId', isEqualTo: countryId)
          .get();
    }

    List<ProductModel> productList =
        products.docs.map((e) => ProductModel.fromMap(e.data())).toList();
    return productList;
  }
}
