import 'package:cloud_firestore/cloud_firestore.dart';

class GetCategoriesService {
  final CollectionReference collectionCategories =
      FirebaseFirestore.instance.collection('categories');

  Future<List<QueryDocumentSnapshot>> getCategories() async {
    final value = await collectionCategories.get();
    return value.docs;
  }
}
