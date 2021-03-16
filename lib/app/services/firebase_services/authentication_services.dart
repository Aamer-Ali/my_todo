import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_todo/app/modules/authentication/models/user_model.dart';

class AuthenticationServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on firebase user
  UserModel _userFromFirebaseUser(User user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  // // authentication change user stream using "firebase user"
  // Stream<User> get user {
  //   return _auth.authStateChanges();
  // }

  // authentication change user stream using "custom uesr model"
  Stream<UserModel> get user {
    // Two methods both are same on working different on code

    //method 1
    // return _auth
    //     .authStateChanges()
    //     .map((User user) => _userFromFirebaseUser(user));

    //method 2
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  bool isUserLogin() {
    return _auth.currentUser == null ? false : true;
  }

// sign in anonymously
  Future<UserModel> signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;

      //doing this is not neccesery
      // we can return the User (Firebase user ) directly
      // Its just for understanding
      // and make the return type as User (Firebase user)

      return _userFromFirebaseUser(user);
      // return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//sign in with email password

//register email and password
  Future<UserModel> registerWithEmailAndPassword(
      {String email, String password}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

//sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
