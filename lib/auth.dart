import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // user sign-in
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    final userCredentials = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    print(userCredentials);
  }

  Future<UserCredential> createUser({
    required String email,
    required String password,
  }) async {
    try {
      final userCredentials =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredentials;
    } catch (err) {
      throw err;
    }
  }

  // user sign-out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // add employee to the fire-base
  Future addEmployeeDetails(
    Map<String, dynamic> employeeInfoMap,
    String id,
  ) async {
    return await FirebaseFirestore.instance
        .collection("Employee")
        .doc(id)
        .set(employeeInfoMap);
  }

  // get employee details
  Future<Stream<QuerySnapshot>> getEmployeeDetails() async {
    return await FirebaseFirestore.instance.collection("Employee").snapshots();
  }

  // update employee details
  Future updateEmployeeDetail(
    Map<String, dynamic> updateInfo,
    String id,
  ) async {
    await FirebaseFirestore.instance
        .collection("Employee")
        .doc(id)
        .update(updateInfo);
  }

  // delete employee detail
  Future deleteEmployeeDetail(String id) async {
    await FirebaseFirestore.instance.collection("Employee").doc(id).delete();
  }
}
