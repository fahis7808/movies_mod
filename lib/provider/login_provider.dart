import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

class LoginPageProvider extends ChangeNotifier {

  bool remember = false;

  onRemember() {
    remember = !remember;
    notifyListeners();
  }

  UserModel? _userModel;

  UserModel get userModel => _userModel!;

  bool _isSignedIn = false;

  bool get isSignedIn => _isSignedIn;

  String? _id;

  String get id => _id.toString();

  LoginPageProvider(){
    signInCheck();
  }

  signInCheck() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    _isSignedIn = sharedPreferences.getBool('is_signedin') ?? false;
    notifyListeners();
  }

  Future setSignIn() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    sharedPreferences.setBool("is_signedin", true);
    _isSignedIn = true;
    notifyListeners();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    try {
      final UserCredential userCredential =
      await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;
      if (user != null) {
        _userModel = UserModel(name: user.displayName.toString(),
            email: user.email.toString(),
            profilePic: user.photoURL.toString(),
            id: user.uid);
        saveUserDataSP().then((value) =>
        setSignIn().then((value) =>
            Navigator.popAndPushNamed(context, 'homePage')));
      }
    } catch (e) {
      print('Sign-in with Google failed: $e');
    }
  }


  Future saveUserDataSP() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(
        'user_model', jsonEncode(userModel.toMap()));

  }

  Future getDataFromSP() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String data = sharedPreferences.getString("user_model") ?? '';
    _userModel = UserModel.fromMap(jsonDecode(data));
    _id = _userModel!.id;
    notifyListeners();
  }

}

