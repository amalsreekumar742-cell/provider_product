import 'package:demo1/features/products/data/model/products_model.dart';
import 'package:demo1/features/products/presentation/provider/product_provider.dart';
import 'package:demo1/general/helpers/formvalidations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Addpro11 extends StatefulWidget {
  const Addpro11({super.key});

  @override
  State<Addpro11> createState() => _Addpro11State();
}

class _Addpro11State extends State<Addpro11> {

  TextEditingController nameController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();      
  TextEditingController priceController=TextEditingController();
  TextEditingController offerController=TextEditingController();

  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Add product"),
    
    ),
    
    body: Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) => FormFieldValidators.required(value),
            controller: nameController,
            decoration: InputDecoration(hintText: "Enter product name"),
          ),
           TextFormField(
            validator: (value) => FormFieldValidators.required(value),
            controller: descriptionController,
            decoration: InputDecoration(hintText: "Enter product description"),
          ),
           TextFormField(
            validator: (value) => FormFieldValidators.price(value),  
            controller: priceController,
            decoration: InputDecoration(hintText: "Enter product price"),
          ),
      
          TextFormField(
            validator: (value) => FormFieldValidators.offerPrice(value,double.tryParse(priceController.text) ?? 0,)  ,
            controller: offerController,
          decoration: InputDecoration(hintText: "Enter offer price"),),
            
                    SizedBox(height: 50, child: ElevatedButton(onPressed: () {
                     if (formKey.currentState!.validate()) {submit(context);}

                    }, child: Text("Upload")))
      
        ],
      ),
    ),
    );
  }
  void submit(BuildContext context) async {
  final name=nameController.text.trim();
  final description=descriptionController.text.trim();
  final price=double.tryParse(priceController.text.trim())??0.0;
  final offer=double.tryParse(offerController.text.trim())??0.0;

  if(name.isEmpty || description.isEmpty || price<=0|| offer<=0) {
    return;
  }

  final val=context.read<ProductProvider>();
  val.addpro(ProductsModel(name: name, description: description, price: price,offerPrice: offer,createdAt: DateTime.now()),);

  Navigator.pop(context);
}
}