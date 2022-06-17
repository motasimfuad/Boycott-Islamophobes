import 'package:boycott_islamophobes/features/product/data/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getProduct(int id);
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
      throw Exception('Product not found');
    }
  }
}
