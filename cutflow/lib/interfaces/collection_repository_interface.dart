import 'package:cloud_firestore/cloud_firestore.dart';

class InterfaceRepository<T> {
  final String collectionName;
  final T Function(
          DocumentSnapshot<Map<String, dynamic>> doc, SnapshotOptions? options)
      fromFirestore;
  final Map<String, Object?> Function(T model, SetOptions? options) toFirestore;

  const InterfaceRepository({
    required this.collectionName,
    required this.fromFirestore,
    required this.toFirestore,
  });

  // Collection reference for the main collection
  CollectionReference<T> get collectionReference {
    return FirebaseFirestore.instance
        .collection(collectionName)
        .withConverter<T>(
          fromFirestore: fromFirestore,
          toFirestore: toFirestore,
        );
  }

  // Méthodes génériques pour manipuler les documents
  Stream<QuerySnapshot<T>> get stream => collectionReference.snapshots();

  Future<DocumentSnapshot<T>> get(String id) =>
      collectionReference.doc(id).get();

  Future<DocumentReference<T>> add(T model) => collectionReference.add(model);

  Future<void> update(String id, Map<String, Object?> data) =>
      collectionReference.doc(id).update(data);

  Future<void> updateField(String id, String field, Object? value) =>
      collectionReference.doc(id).update({field: value});

  Future<void> delete(String id) => collectionReference.doc(id).delete();

  Future<void> set(String id, T model, SetOptions? options) =>
      collectionReference.doc(id).set(model, options);

  Future<void> setWithMerge(String id, T model) =>
      collectionReference.doc(id).set(model, SetOptions(merge: true));

  DocumentReference<T> getDocumentReference(String? id) =>
      collectionReference.doc(id);

  Future<DocumentSnapshot<T>> fromDocumentReference(
          DocumentReference<T> reference) =>
      reference
          .withConverter<T>(
              fromFirestore: fromFirestore, toFirestore: toFirestore)
          .get();
}
