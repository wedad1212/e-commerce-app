// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/core/model/user_model.dart';

class FireStoreSaveDataUser {

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addToFireStoreUser(user) async {
    return await users.doc(user.userId).set(user.toJson());
  }

  Future<DocumentSnapshot> currentUser(String uid) async {
  return await users.doc(uid).get();
  }
}
