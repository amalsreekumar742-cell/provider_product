import 'package:demo1/features/products/data/model/products_model.dart';
import 'package:demo1/features/products/presentation/provider/product_provider.dart';
import 'package:demo1/features/products/presentation/view/addpro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class productHome1 extends StatefulWidget {
  const productHome1({super.key});

  @override
  State<productHome1> createState() => _productHome1State();
}

class _productHome1State extends State<productHome1> {

  
  
  final TextEditingController updateController=TextEditingController();
    final TextEditingController updateController1=TextEditingController();
        final TextEditingController updateController2=TextEditingController();
        final TextEditingController updateController3=TextEditingController();


  
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      initdata();
    });
  }
  void initdata(){
      final pro1=context.read<ProductProvider>();
pro1.fetchpro();
  }


  void showUpdateDialog(ProductsModel pro) {
    updateController.text=pro.name??'';
    updateController1.text=pro.description??'';
    updateController2.text=pro.price?.toString()??'';
    updateController3.text=pro.offerPrice?.toString()??'';
    final val1=context.read<ProductProvider>();

    

    showDialog(
      context: context,
      builder: (context) {

        return AlertDialog(
          title: const Text("Update Task"),
          content:SizedBox(height: 150,
            child: Column(
              children: [
                 TextField(
              controller: updateController,
              decoration: const InputDecoration(hintText: "Update task text"),
            ),
            
             TextField(
              controller: updateController1,
              decoration: const InputDecoration(hintText: "Update description"),
            ),
            TextField(
              controller: updateController2,
              decoration: const InputDecoration(hintText: "Update price"),
            )
            
              ],
            ),
          ),
          
          
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel")),

            ElevatedButton(
              onPressed: () async {
                String newText = updateController.text.trim();
                String newtext2=updateController1.text.trim();
               final val= double.tryParse(updateController2.text.trim())??0.0;

                if (newText.isEmpty || newtext2.isEmpty||  val<=0) return;
val1.updatepro(ProductsModel(name:  newText,description:  newtext2,price:val, id: pro.id,),);   
                Navigator.pop(context);
              },
              child: const Text("Update"),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
final pro1=context.watch<ProductProvider>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const addpro11()));
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(itemCount: pro1.product.length, itemBuilder: (BuildContext context, int index) {
        final prolist=pro1.product[index];
        return SizedBox(height: 110,width: double.infinity,
          child: Card(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  SizedBox(height: 20),
                  Text("productname:${prolist.name}"),
                  Text("productdescription:${prolist.description}"),
                  Text('productprice:${prolist.price}'),
                  Text('offeredprice:${prolist.offerPrice}'),
                  
                ],
              ),

               IconButton(onPressed: (){
                        showUpdateDialog(prolist);
                      }, icon: const Icon(Icons.edit)),
                      IconButton(onPressed: (){
                        pro1.deletepro(prolist.id!);
                      }, icon: const Icon(Icons.delete)),
            ],
          ),),
        );
        
      }),


      
    );
  }
}