import 'package:demo1/general/core/type_def.dart';

abstract class AuthRepo {
  FutureResult<void> signupWithEmailPass(String email, String password,String name);
  
}