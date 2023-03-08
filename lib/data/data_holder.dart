import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'entities/profile.dart';

class DataHolder {

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  GlobalKey<FormState> keyForm = GlobalKey();
  FirebaseStorage storage = FirebaseStorage.instance;
  Profile profile = Profile();
  String videoUrlYoutube = '';

  static final DataHolder _dataHolder = DataHolder._internal();

  DataHolder._internal();

  factory DataHolder() {
    return _dataHolder;
  }
}
