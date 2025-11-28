import 'dart:developer';
import 'package:demo1/features/products/data/model/products_model.dart';
import 'package:demo1/features/products/repo/i_product_impl.dart';
import 'package:demo1/general/core/failures/main_failure.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final IProductImpl rep;
  
  ProductProvider(this.rep);
  List<ProductsModel> product=[];
  bool isLoading=false;
  MainFailure? error;

Future<void> fetchpro() async{
  isLoading=true;
  notifyListeners();

  final result=await rep.fetchProduct();
  result.fold((err) {
    error=err;
    log("$error");
    isLoading=false;
    notifyListeners();
  }, (result) {
    product=result;
    isLoading=false;
    notifyListeners();
  });

}

Future<void> addpro(ProductsModel pro) async{
  isLoading=true;
  notifyListeners();

  final result=await rep.addProduct(pro);
  result.fold((l) {
    error=l;
    isLoading=false;
    notifyListeners();
  }, (result) {
    product.add(result as ProductsModel );
    isLoading=false;
    notifyListeners();
  }); 

}

Future<void> updatepro(ProductsModel pro) async{
  isLoading=true;
  notifyListeners();

  final result=await rep.updateProduct(pro);
  result.fold((l) {
    error=l;
    isLoading=false;
    notifyListeners();
  }, (r) {
    final index=product.indexWhere((element) => element.id==pro.id);
    product[index]=r as ProductsModel;
    isLoading=false;
    notifyListeners();
  }); 
}


Future<void> deletepro(String id) async{
  isLoading=true;
  notifyListeners();

  final result=await rep.deleteProduct(id);
  result.fold((l) {
    error=l;
    isLoading=false;
    notifyListeners();
  }, (r) {
    product.removeWhere((element) => element.id==id);
    isLoading=false;
    notifyListeners();
  }); 
}
}

