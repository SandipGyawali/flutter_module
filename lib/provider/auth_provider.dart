import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_m/auth.dart';
import 'package:flutter_m/routes/route_consts.dart';
import 'package:flutter_m/services/firestore.dart';
import 'package:flutter_m/utils/flush_status.dart';
import 'package:flutter_m/utils/utils.dart';
import 'package:go_router/go_router.dart';

class AuthProvider with ChangeNotifier {
  final auth = Auth();

  signInWithEmailAndPassword(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      await auth.signIn(
        email: email,
        password: password,
      );

      GoRouter.of(context)
          .pushReplacementNamed(MyAppRouteConstants.layoutRoute);
      Utils.flushBarMessage(
        "Login Successful",
        context,
        STATUS.SUCCESS,
      );
    } on FirebaseAuthException catch (err) {
      if (err.code == "user-not-found") {
        Utils.flushBarMessage(
          "No user found with provided credentials0",
          context,
          STATUS.ERROR,
        );
      } else if (err.code == "wrong-password") {
        Utils.flushBarMessage(
          "Entered password was wrong",
          context,
          STATUS.ERROR,
        );
      }
    } catch (err) {
      Utils.flushBarMessage(
        err.toString(),
        context,
        STATUS.ERROR,
      );
    }
  }

  createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
    BuildContext context,
  ) async {
    try {
      UserCredential userCredential = await auth.createUser(
        email: email,
        password: password,
      );

      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      await FirestoreServices.saveUser(name, email, userCredential.user!.uid);
      GoRouter.of(context)
          .pushReplacementNamed(MyAppRouteConstants.layoutRoute);
      Utils.flushBarMessage("Signup successful", context, STATUS.SUCCESS);
    } on FirebaseAuthException catch (err) {
      if (err.code == "weak-password") {
        Utils.flushBarMessage(
          "Password provided is too weak",
          context,
          STATUS.ERROR,
        );
      } else if (err.code == "email-already-in-use") {
        Utils.flushBarMessage(
          "Email Provided already in use",
          context,
          STATUS.ERROR,
        );
      }
    } catch (err) {
      Utils.flushBarMessage(
        err.toString(),
        context,
        STATUS.ERROR,
      );
    }
  }

  signOut(BuildContext context) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // remove fire-store data associated with the user.
        await FirestoreServices.deleteUser(user.uid);
      }

      await auth.signOut();
      GoRouter.of(context).pushReplacementNamed(MyAppRouteConstants.baseRoute);
      Utils.flushBarMessage(
        "Signout successful",
        context,
        STATUS.SUCCESS,
      );
    } catch (err) {
      Utils.flushBarMessage(
        err.toString(),
        context,
        STATUS.ERROR,
      );
    }
  }

  // add employee to the firestore
  Future addEmployeeDetails(Map<String, dynamic> employeeInfoMap, String id,
      BuildContext context) async {
    try {
      final data = await auth.addEmployeeDetails(employeeInfoMap, id);
      Utils.flushBarMessage(
        "Employee added successfully",
        context,
        STATUS.SUCCESS,
      );

      return data;
    } catch (err) {
      Utils.flushBarMessage(
        err.toString(),
        context,
        STATUS.ERROR,
      );
    }
  }

  Future updateEmployeeDetail(
    Map<String, dynamic> updateInfo,
    String id,
    BuildContext context,
  ) async {
    try {
      await auth.updateEmployeeDetail(updateInfo, id);

      Utils.flushBarMessage(
        "Data updated Successfully",
        context,
        STATUS.SUCCESS,
      );
    } catch (err) {
      Utils.flushBarMessage(
        err.toString(),
        context,
        STATUS.ERROR,
      );
    }
  }

  Future deleteEmployeeDetail(String id, BuildContext context) async {
    try {
      await auth.deleteEmployeeDetail(id);

      Utils.flushBarMessage(
        "Deleted Successfully",
        context,
        STATUS.SUCCESS,
      );
    } catch (err) {
      Utils.flushBarMessage(
        err.toString(),
        context,
        STATUS.ERROR,
      );
    }
  }
}
