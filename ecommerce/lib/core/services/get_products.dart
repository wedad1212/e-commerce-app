import 'package:cloud_firestore/cloud_firestore.dart';

class GetProductsService {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('products');

  Future<List<QueryDocumentSnapshot>> getProduct() async {
    final value = await collectionReference.get();
    return value.docs;
  }
}
