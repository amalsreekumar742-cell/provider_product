import 'package:demo1/features/auth/data/model/signupmodel.dart';
import 'package:demo1/features/auth/repo/i_auth_impl.dart';
import 'package:demo1/general/core/failures/main_failure.dart';
import 'package:flutter/material.dart';

class LoginSignupProvider extends ChangeNotifier {
  final IAuthImpl repo;

  LoginSignupProvider({required this.repo});

  List<Signupmodel> sign = [];
  bool isLoading = false;
  MainFailure? error;

  Future<void> signup(String email, String password, String name) async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await repo.signupWithEmailPass(email, password, name);

    result.fold(
      (l) {
        error = l;
        isLoading = false;
        notifyListeners();
      },
      (signupModel) {
        // signupModel is a Signupmodel object
        sign.add(signupModel);   // ✔ FIXED
        isLoading = false;
        notifyListeners();
      },
    );
  }
}
