import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo1/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseInjectableModule {
  // ignore: invalid_annotation_target
  @preResolve
  Future<FirebaseService> get firebaseService => FirebaseService.init();

  // @lazySingleton
  // FirebaseStorage get firebaseStorage => FirebaseStorage.instance;

  @lazySingleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
/*

  @lazySingleton
  FirebaseMessaging get firebaseMessaging => FirebaseMessaging.instance;

  @lazySingleton
  ImagePicker get imagePicker => ImagePicker();

  @lazySingleton
  ImageServices imageServices(FirebaseStorage storage, ImagePicker picker) =>
      ImageServices(storage, picker);*/
}

class FirebaseService {
  static Future<FirebaseService> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    return FirebaseService();
  }
}
