import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:theratyp/data/entities/profile.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../data_holder.dart';
import 'dart:io';

class AdminData {

  Future pickUploadImage() async {

    ImagePicker image = ImagePicker();
    XFile? file = await image.pickImage(source: ImageSource.gallery);

    if (file == null) return;

    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referenceRoot = DataHolder().storage.ref();
    Reference referenceDirImages = referenceRoot.child('images');

    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

    try {

      await referenceImageToUpload.putFile(File(file!.path));
      String uri = await referenceImageToUpload.getDownloadURL();
      print("------------------URI" + uri);
      return uri;


    } catch (error) {
      debugPrint(error.toString());
    }
  }

  void insertProfile(String name, int age, String city, String country,
      String path, BuildContext context) async {
    Profile p = Profile(
        name: name, country: country, city: city, age: age, imagen: path);

    print("----------INSERTAR " + path);
    await DataHolder()
        .db
        .collection("profiles")
        .doc(DataHolder().auth.currentUser?.uid)
        .set(p.toFirestore())
        .onError((e, _) => print("Error writing document: $e"));

    Navigator.of(context).popAndPushNamed("/home_view");
  }


  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await DataHolder().auth.signInWithCredential(credential);
  }

  Future resetPassword(String emailAddress) async {
    try {
      await DataHolder().auth.sendPasswordResetEmail(email: emailAddress);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //logica de la clase login. Creamos la funcion asincrona que comprueba usuario y contraseña.
  Future singIn(
      String emailAddress, String password, BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      await DataHolder().auth.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //metodo para registrarse en la app.
  void signUp(
      String emailAddress, String password, BuildContext context) async {
    try {
      final credential = await DataHolder().auth.createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

      debugPrint("ME HE REGISTRADO");
      Navigator.popAndPushNamed(context, '/login_view');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> isGetProfile() async {
    String? idUser = DataHolder().auth.currentUser?.uid;

    final docRef =
        DataHolder().db.collection("profiles").doc(idUser).withConverter(
              fromFirestore: Profile.fromFirestore,
              toFirestore: (Profile profile, _) => profile.toFirestore(),
            );

    DocumentSnapshot docsnap = await docRef.get();
    return docsnap.exists;
  }

  void singOut(context) async {
    print("ME DESLOGUESOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
    await DataHolder().auth.signOut();
    Navigator.of(context).popAndPushNamed('/login_view');
  }
}
