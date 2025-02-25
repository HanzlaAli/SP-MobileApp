import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class FireBaseRepoBase {
  final fireStore = FirebaseFirestore.instance;
  Future<int> save(uId, String collection, var model) async {
    try {
      if (uId == null) {
        fireStore.collection(collection).add(model);
      } else {
        fireStore.collection(collection).doc(uId.toString()).set(model);
      }
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future get(
    String collection,
  ) async {
    var snapShot;
    try {
        snapShot = await fireStore.collection(collection).get();
    
      return snapShot;
    } catch (e) {
      return 500;
    }
  }

  Future<Either<int, DocumentSnapshot>> getDocument(
    uId,
    String collection,
  ) async {
    DocumentSnapshot snapShot;
    try {
      snapShot =
          await fireStore.collection(collection).doc(uId.toString()).get();
      return right(snapShot);
    } catch (e) {
      return left(500);
    }
  }
}
