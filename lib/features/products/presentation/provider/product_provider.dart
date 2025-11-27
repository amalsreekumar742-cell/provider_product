import 'package:demo1/features/products/data/model/products_model.dart';
import 'package:demo1/features/products/repo/product_repo.dart';
import 'package:demo1/general/failure.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepo rep;
  ProductProvider(this.rep);
  List<ProductsModel> product=[];
  bool isLoading=false;
  Failure? error;

Future<void> fetchpro() async{
  isLoading=true;
  notifyListeners();

  final result=await rep.getAllProducts();
  result.fold((l) {
    error=l;
    isLoading=false;
    notifyListeners();
  }, (r) {
    product=r;
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
  }, (r) {
    product.add(r);
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
    final index=product.indexWhere((element) => element.id==r.id);
    product[index]=r;
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