import 'package:demo1/features/products/presentation/provider/product_provider.dart';
import 'package:demo1/features/products/presentation/view/product_hom.dart';
import 'package:demo1/features/products/repo/product_repo.dart';
import 'package:demo1/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final repo=ProductRepo();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create:(context) => ProductProvider(repo),)
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      
      home:productHome1(),debugShowCheckedModeBanner: false,
    );
  }
}



