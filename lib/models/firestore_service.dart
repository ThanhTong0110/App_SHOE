import 'package:cloud_firestore/cloud_firestore.dart';

import 'shoe_model.dart';

class FirestoreService {
  static final FirestoreService _firestoreService =
  FirestoreService._internal();
  Firestore db = Firestore.instance;

  FirestoreService._internal();

  factory FirestoreService() {
    return _firestoreService;
  }

  //READ
  Stream<List<ShoeModel>> getShoe() {
    return db.collection('Shoe').snapshots().map(
          (snapshot) =>
          snapshot.documents.map(
                (doc) => ShoeModel.fromMap(doc.data, doc.documentID),
          ).toList(),
    );
  }
}