import 'package:demo1/features/auth/presentation/provider/login_signup_provider.dart';
import 'package:demo1/features/auth/presentation/view/signup.dart';
import 'package:demo1/features/auth/repo/i_auth_impl.dart';
import 'package:demo1/features/products/presentation/provider/product_provider.dart';
import 'package:demo1/features/products/presentation/view/addpro.dart';

import 'package:demo1/features/products/repo/i_product_impl.dart';
import 'package:demo1/firebase_options.dart';
import 'package:demo1/general/core/di/injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
      ChangeNotifierProvider(create:(_) { ProductProvider(
        sl<IProductImpl>(),
      );
      }),
      ChangeNotifierProvider(
      create: (_) => LoginSignupProvider(
        repo: sl<IAuthImpl>(),
      ),
    ),
    ],
      child: MaterialApp(

        home:Signup1(),debugShowCheckedModeBanner: false,
      ),
    );
  }
}



