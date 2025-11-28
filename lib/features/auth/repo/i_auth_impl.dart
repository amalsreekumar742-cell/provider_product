import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:demo1/features/auth/data/model/signupmodel.dart';
import 'package:demo1/features/auth/repo/auth_repo.dart';
import 'package:demo1/general/core/failures/main_failure.dart';
import 'package:demo1/general/core/type_def.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as:AuthRepo )
class IAuthImpl implements AuthRepo {
    final FirebaseAuth _firebaseAuth;
    final FirebaseFirestore _firestore;

  IAuthImpl(this._firebaseAuth,this._firestore);
@override
FutureResult<Signupmodel> signupWithEmailPass(
    String email, String password, String name) async {
  try {
    final UserCredential userCred =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );

    final String uid = userCred.user!.uid;

    final newUser = Signupmodel(
      id: uid,
      email: email,
      name: name,
    );

    await _firestore.collection('users').doc(uid).set(newUser.toMap());

    return right(newUser);

  } catch (e) {
    return left(MainFailure.generalFailure(errMsg: e.toString()));
  }
}

}