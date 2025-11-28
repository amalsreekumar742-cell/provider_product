 import 'package:demo1/features/products/data/model/products_model.dart';
import 'package:demo1/general/core/type_def.dart';

 abstract class ProductRepoImpl  {
  //ADD PRODUCT
  FutureResult<List<ProductsModel>> addProduct(ProductsModel product);
  // FETCH PRODUCT
  FutureResult<List<ProductsModel>> fetchProduct();
  // Update Product
  FutureResult<List<ProductsModel>> updateProduct(ProductsModel product);
  // DELETE PRODUCT
  FutureResult<void> deleteProduct(String id);
  
 }