import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

abstract class FirestoreServiceBase {
  final FirebaseFirestore firestore;

  FirestoreServiceBase({required this.firestore});

  Future<Map<String, dynamic>> get({
    required String collection,
    required String documentId,
  });

  Future<List<Map<String, dynamic>>> getAll({
    required String collection,
  });

  Future<void> create({
    required String collection,
    required Map<String, dynamic> data,
  });

  Future<void> update({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
  });

  Future<void> delete({
    required String collection,
    required String documentId,
  });
}

@Injectable(as: FirestoreServiceBase)
class FirestoreService extends FirestoreServiceBase {
  FirestoreService({required super.firestore});

  @override
  Future<Map<String, dynamic>> get({
    required String collection,
    required String documentId,
  }) async {
    try {
      DocumentSnapshot doc = await firestore.collection(collection).doc(documentId).get();
      if (doc.exists) {
        return doc.data() as Map<String, dynamic>;
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> create({
    required String collection,
    required Map<String, dynamic> data,
  }) async {
    try {
      await firestore.collection(collection).add(data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> update({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await firestore.collection(collection).doc(documentId).update(data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> delete({
    required String collection,
    required String documentId,
  }) async {
    try {
      await firestore.collection(collection).doc(documentId).delete();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getAll({
    required String collection,
  }) async {
    try {
      QuerySnapshot querySnapshot = await firestore.collection(collection).get();

      return querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        return data;
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

}
