import 'package:boycott_islamophobes/features/category/data/models/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getAllCategories();
  Future<CategoryModel> getCategory(int id);
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final FirebaseFirestore firestore;
  CategoryRemoteDataSourceImpl(this.firestore);

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    var categoriesCollection = await firestore.collection('categories').get();
    var categoryList = categoriesCollection.docs
        .map((category) => CategoryModel.fromMap(category.data()))
        .toList();
    return categoryList;
  }

  @override
  Future<CategoryModel> getCategory(int id) async {
    var catCollections = await firestore
        .collection('categories')
        .where('id', isEqualTo: id)
        .get();
    var category =
        catCollections.docs.map((e) => CategoryModel.fromMap(e.data())).first;
    return category;
  }
}
