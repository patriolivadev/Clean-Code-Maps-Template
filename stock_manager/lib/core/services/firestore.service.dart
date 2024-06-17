import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Create a new document
  Future<void> createDocument(String collectionPath, Map<String, dynamic> data) async {
      await _db.collection(collectionPath).add(data);
  }

  // Get a document by ID
  Future<DocumentSnapshot<Map<String, dynamic>>> getDocument(String collectionPath, String docId) async {
      return await _db.collection(collectionPath).doc(docId).get();
  }

  // Get all documents from a collection
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getDocuments(String collectionPath) async {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _db.collection(collectionPath).get();
      return querySnapshot.docs;
  }

  // Update a document by ID
  Future<void> updateDocument(String collectionPath, String docId, Map<String, dynamic> data) async {
    await _db.collection(collectionPath).doc(docId).update(data);
  }

  // Delete a document by ID
  Future<void> deleteDocument(String collectionPath, String docId) async {
      await _db.collection(collectionPath).doc(docId).delete();
  }
}
