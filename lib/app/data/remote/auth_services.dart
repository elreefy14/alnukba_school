/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

import '../models/user_model.dart';

class AuthServices {
  User? checkCurrentUser() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Logger().i(user.email);
    } else {
      Logger().w("FireBase USer = NULL");
    }
    return user;
  }

  Future<UserModel?> signin(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return await fetchUserData(userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Logger().e('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Logger().e('Wrong password provided for that user.');
      }
      rethrow; // Rethrow the exception to be handled by your app
    }
  }

  Future<UserModel?> fetchUserData(String userId) async {
    Logger().i(userId);

    return await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        UserModel userData =
            UserModel.fromMap(documentSnapshot.data() as Map<String, dynamic>);
        // Use the fetched user data here
        print('User data: $userData');
        return userData;
      } else {
        Logger().e('User document does not exist');
        return null;
      }
    }).catchError((error) {
      Logger().e('Error fetching user data: $error');
      return null;
    });
  }
}
*/