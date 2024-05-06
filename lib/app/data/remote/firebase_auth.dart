import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getx_skeleton/app/data/remote/firestore_db.dart';
import 'package:getx_skeleton/utils/constants.dart';
import 'package:logger/logger.dart';

import '../models/user_model.dart';

class AuthServices {
  FireStorDB _fireStorDB = FireStorDB();
  User? checkCurrentUser() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      //   Logger().i(user.email);
    } else {
      // Logger().w("FireBase User = NULL");
    }
    return user;
  }

  // SignUp with password and gmail
  /* Future<UserCredential> signup(UserModel appUser) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: appUser.email!, password: appUser.password!);
      registerUserInfo(userCredential, appUser);
      Logger().i(userCredential.credential?.token);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Logger().e('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Logger().e('The account already exists for that email.');
      }
      rethrow; // Rethrow the exception to be handled by your app
    }
  }
*/
// Register User Info in database after signup
  Future registerUserInfo(
      UserCredential userCredential, UserModel appUser) async {
    appUser.id = userCredential.user!.uid;

    // Create a new document in Firestore with the user's information
    await FirebaseFirestore.instance
        .collection('users')
        .doc(appUser.id)
        .set(appUser.toMap());
  }

  Future<UserModel> signin(String email, String password) async {
    try {
      //trim all
      String emailWithoutSpaces = email.trim();
      String passwordWithiutSpaces = password.trim();
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailWithoutSpaces + "@gmail.com",
        password: passwordWithiutSpaces,
      );

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

  Future<bool> signout() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.signOut();
      // Navigate to the login screen or other appropriate UI
      return true;
    } on FirebaseAuthException catch (e) {
      // Handle exception appropriately (e.g., display an error message)
      print('Error signing out: ${e.code}');
      rethrow;
    }
  }

  Future<UserModel> fetchUserData(String userId) async {
     Logger().i(userId);
     //cons
    return await FirebaseFirestore.instance
        .collection(Constants.usersCollection)
        .doc(userId)
        .get()
        .then((value) {
    //  UserModel userData = UserModel.fromMap(value.data() as Map<String, dynamic>);
      /*
      /flutter (25223): │ ! {
I/flutter (25223): │ !   "address": "null",
I/flutter (25223): │ !   "role": "user",
I/flutter (25223): │ !   "municipality": "asd",
I/flutter (25223): │ !   "fullName": "null",
I/flutter (25223): │ !   "uid": "asd",
I/flutter (25223): │ !   "password": "123456",
I/flutter (25223): │ !   "phone": "null",
I/flutter (25223): │ !   "imageUrl": "null",
I/flutter (25223): │ !   "id": "FxSItAUVS2SbkuPAXE12VlP70wp2",
I/flutter (25223): │ !   "state": "as",
I/flutter (25223): │ !   "fcmToken": "eXTTT75cTIWlKuRW87LdGU:APA91bHRBzQ22gWq7arPIYC_ovKBgl8rDYmlygqXGSH0GDxN5CJTPYSlMU9vyiv25kZD3vFTw821s8CtFqyXEjoYdL8PFzTMftBC91trkYAo3kKfuFiUktQc-sEx2KSUgTsVWBsBLDsO",
I/flutter (25223): │ !   "email": "1234567891",
I/flutter (25223): │ !   "username": "1234567891"
I/flutter (25223): │ ! }
      */
      UserModel userData = UserModel(
        id: value.data()!['id'],
        username: value.data()!['username'],
        email: value.data()!['email'],
        phoneNumber: value.data()!['phone'],
       // imageUrl: value.data()!['imageUrl'],
        password: value.data()!['password'],
      //  state: value.data()!['state'],
      //  municipality: value.data()!['municipality'],
        uid: value.data()!['uid'],
        fcmToken: value.data()!['fcmToken'],
        role: value.data()!['role'],
        address: value.data()!['address'],
        fullName: value.data()!['fullName'],
        // /unreadNotifications
         unreadNotifications: value.data()!['unreadNotifications'],
      );
      return userData;
    }).catchError((error) {
      Logger().e('Error fetching user data: $error');
      throw error;
    });
  }

  Future changePassword(String newPassword, String oldPassword) async {
    try {
      User user = FirebaseAuth.instance.currentUser!;
      await user.reauthenticateWithCredential(
        EmailAuthProvider.credential(
          email: user.email!,
          password: oldPassword,
        ),
      );
      await user.updatePassword(newPassword);
      // Password updated successfully!
      Logger().i('Password updated successfully!');
    } on FirebaseAuthException catch (e) {
      rethrow;
    }
  }

//  signup
  Future<UserModel> signup(
    String email, String password,
     [String? value]) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            //add placeholder email
            email: email + "@gmail.com",
           password: password
           );
      UserModel appUser = UserModel(
          id: userCredential.user!.uid,
          email: email,
          password: password,
          username: email, 
          phoneNumber:email,
         // imageUrl: 'null',
          role: value ?? 'user',
          //state: 'as',
          //municipality: 'asd',
          uid: 'asd', 
          //imageUrl: 'null',
          address: 'null',
          fullName: 'null',
          );
      await registerUserInfo(userCredential, appUser);
      return appUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Logger().e('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Logger().e('The account already exists for that email.');
      }
      rethrow; // Rethrow the exception to be handled by your app
    }
  }

  /*then((DocumentSnapshot documentSnapshot) {
      UserModel userData =
          UserModel.fromMap(documentSnapshot.data() as Map<String, dynamic>);
      // Use the fetched user data here
      print('User data: ${userData.id}');
      return userData;
    }*/
}
/*.catchError((error) {
      Logger().e('Error fetching user data: $error');
      return null;
    });
  */