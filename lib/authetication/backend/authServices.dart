import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wabayetu/model/user.dart' as model;
import 'package:shared_preferences/shared_preferences.dart';


class AuthService {
  String reg = "working";

  Future<String?> registration({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String role,
     String location = "not applicable",
     String bio = "not applicable",
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final message =
          await addUser(name: name, email: email,phone : phone, role : role,location : location, bio : bio);

      var returnMessage = "";
      if (message!.contains('Added user')) {
        returnMessage = "Success";
      } else {
        returnMessage = message;
      }

      await FirebaseFirestore.instance
          .collection('notification')
          .add({
        'title': "Account Registration",
        'email': email,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
        'status': true,
        'message': "registration was successful"
      });

      return returnMessage;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final message = await getUserDetails();

      var returnMessage = "";
      if (message!.contains('welcome')) {
        returnMessage = "welcome";
      } else {
        returnMessage = message;
      }

      await FirebaseFirestore.instance
          .collection('notification')
          .add({
        'title': "Account Authentication",
        'email': email,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
        'status': true,
        'message': "login was successful"
      });

      return returnMessage;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> reset({
    required String email,
  }) async {
    try {
      var returnMessage = "";
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email)
          .then((value) => returnMessage = "password reset was successfully")
          .catchError((e) => returnMessage = e.toString());


      await FirebaseFirestore.instance
          .collection('notification')
          .add({
        'title': "Password Reset",
        'email': email,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
        'status': true,
        'message': returnMessage
      });



      return returnMessage;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> addUser(
      {required String email,
      required String role,
      required String name,
      required String phone,
      required String bio,
      required String location,
      }) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'full_name': name,
        'email': email,
        'role': role,
        'phone': phone,
        'bio': bio,
        'location': location,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
        'status': true,
        'photoUrl': "empty"
      });

      return 'Added user';
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> getUserDetails() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      var returnMessage = "";
      if (model.Users.fromSnap(documentSnapshot).role! == 'farmer') {
        returnMessage = "welcome";
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('name', model.Users.fromSnap(documentSnapshot).name);
        prefs.setString('email', model.Users.fromSnap(documentSnapshot).email);
        prefs.setString('login', "in");
        prefs.setString('role', model.Users.fromSnap(documentSnapshot).role);
        prefs.setBool('status', model.Users.fromSnap(documentSnapshot).status);
        prefs.setString(
            'photoUrl', model.Users.fromSnap(documentSnapshot).photoUrl);
      } else {
        returnMessage = "invalid user!";
      }

      return returnMessage;
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }





}
