import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static saveUser(String name, email, uid) async {
    await _db.collection("users").doc(uid).set({
      "email": email,
      "name": name,
    });
  }

  static deleteUser(String id) async {
    // delete user document
    await _db.collection("users").doc(id).delete();
  }
}
