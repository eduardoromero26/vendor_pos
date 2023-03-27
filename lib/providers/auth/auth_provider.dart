import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final _storage = const FlutterSecureStorage();

  // Recupera el código de usuario desde SecureStorage
  Future<String?> getUserCode() async {
    return await _storage.read(key: 'userCode');
  }

  // Almacena el código de usuario en SecureStorage
  Future<void> setUserCode(String code) async {
    await _storage.write(key: 'userCode', value: code);
  }

//login with email and password in firebase
  void loginWithEmailPassword(email, password, context) async {
    var authRes = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (authRes != null) {
      // Almacena el código de usuario en SecureStorage
      await setUserCode(authRes.user!.uid);
      Navigator.pushReplacementNamed(context, '/');
    } else {}
  }

//register with email and password in firebase
  void registerWithEmailPassword(name, email, mobile, password, context) {
    _auth
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      // Almacena el código de usuario en SecureStorage
      setUserCode(value.user!.uid);
      insertToFirestore(name, email, mobile);
      Navigator.pushReplacementNamed(context, '/');
    }).catchError((e) {});
  }

//insert data to firestore
  insertToFirestore(name, email, mobile) {
    var user = FirebaseAuth.instance.currentUser;
    var uid = user!.uid;
    FirebaseFirestore.instance.collection("accounts").doc(uid).set({
      "uid": uid,
      "displayName": name,
      "email": email,
      "mobile": mobile,
      "createdAt": FieldValue.serverTimestamp(),
      "imageURL": "https://picsum.photos/200/300",
      "token": 10000,
    });
  }

  //logout from firebase
  void logout(context) async {
    _auth.signOut().then((value) {
      // Elimina el código de usuario de SecureStorage
      _storage.delete(key: 'userCode');
      Navigator.pushReplacementNamed(context, '/loginscreen');
      notifyListeners();
    });
  }
}
