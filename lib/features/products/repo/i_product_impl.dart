import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:demo1/features/products/data/model/products_model.dart';
import 'package:demo1/features/products/repo/product_repo.dart';
import 'package:demo1/general/core/failures/main_failure.dart';
import 'package:demo1/general/core/type_def.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: ProductRepoImpl)
class IProductImpl implements ProductRepoImpl {
  final FirebaseFirestore _firestore;

  IProductImpl(this._firestore);



  @override
  FutureResult<List<ProductsModel>> addProduct(ProductsModel product)async {
 try {
    final docid=_firestore.collection('products').doc().id;
    final model=product.copyWith(id: docid);
    await _firestore.collection('products').doc(docid).set(model.toMap());
    return right(model as List<ProductsModel>);
  } catch (e) {
    return left(MainFailure.generalFailure(errMsg: e.toString()));
  }
  }
  
  @override
  FutureResult<bool> deleteProduct(String id) async {
    try {
    await _firestore.collection('products').doc(id).delete();
    return right(true);
  } catch (e) {
return Left(MainFailure.generalFailure(errMsg:  e.toString())); }
}

  @override
  FutureResult<List<ProductsModel>> fetchProduct()async {
  try {
    final snapshot=await _firestore.collection('products').get();
    final list=snapshot.docs.map((doc)=>ProductsModel.fromMap(doc.data()).copyWith(id: doc.id)).toList();

    return right(list);
    
    } 
    
    catch (e) {
      return left(MainFailure.generalFailure(errMsg: e.toString()));
    }
  }

  @override
  FutureResult<List<ProductsModel>> updateProduct(ProductsModel product)async {
   try{
    await _firestore.collection('products').doc(product.id).update(product.toMap());
    return right(product as List<ProductsModel>);
  } catch (e) {
    return left(MainFailure.generalFailure(errMsg: e.toString()));
  }
  }
  
  }
  
  
  
  



/*
class ProductRepo {
  final FirebaseFirestore db=FirebaseFirestore.instance;

   Future<Either<Failure,List<ProductsModel>>> getAllProducts() async {
    try {
    final snapshot=await db.collection('products').get();
    final list=snapshot.docs.map((doc)=>ProductsModel.fromMap(doc.data()).copyWith(id: doc.id)).toList();

    return right(list);
    
    } 
    
    catch (e) {
      return left(Failure(e.toString()));
    }
    
}
  Future<Either<Failure, ProductsModel>>addProduct(ProductsModel product) async{
  try {
    final docid=db.collection('products').doc().id;
    final model=product.copyWith(id: docid);
    await db.collection('products').doc(docid).set(model.toMap());
    return right(model);
  } catch (e) {
    return left(Failure(e.toString()));
  }


}


Future<Either<Failure,ProductsModel>> updateProduct(ProductsModel product) async{
  try{
    await db.collection('products').doc(product.id).update(product.toMap());
    return right(product);
  } catch (e) {
    return left(Failure(e.toString()));
  }
}

Future<Either<Failure,bool>> deleteProduct(String id) async {
  try {
    await db.collection('products').doc(id).delete();
    return right(true);
  } catch (e) {
return Left(Failure(e.toString())); }
}
}*/