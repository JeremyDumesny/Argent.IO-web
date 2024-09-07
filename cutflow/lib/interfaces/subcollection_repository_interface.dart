import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cutflow/interfaces/collection_repository_interface.dart';

class SubcollectionRepository<T> extends InterfaceRepository<T> {
  final String documentId;
  final List<String> subcollectionPath;

  SubcollectionRepository({
    required super.collectionName,
    required this.documentId,
    required this.subcollectionPath,
    required super.fromFirestore,
    required super.toFirestore,
  });

  @override
  CollectionReference<T> get collectionReference {
    CollectionReference<Map<String, dynamic>> ref = FirebaseFirestore.instance
        .collection(collectionName)
        .doc(documentId)
        .collection(subcollectionPath[0]);

    for (int i = 1; i < subcollectionPath.length - 1; i += 2) {
      ref = ref.doc(subcollectionPath[i]).collection(subcollectionPath[i + 1]);
    }

    return ref.withConverter<T>(
      fromFirestore: fromFirestore,
      toFirestore: toFirestore,
    );
  }
}
