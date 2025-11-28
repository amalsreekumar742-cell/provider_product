import 'package:demo1/features/auth/presentation/provider/login_signup_provider.dart';
import 'package:demo1/general/helpers/formvalidations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Signup1 extends StatefulWidget {
  const Signup1({super.key});

  @override
  State<Signup1> createState() => _Signup1State();
}

class _Signup1State extends State<Signup1> {

  TextEditingController namecon=TextEditingController();
  TextEditingController emailcon=TextEditingController();
  TextEditingController passwordcon=TextEditingController();
  GlobalKey<FormState> globalKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: globalKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
        
        
            TextFormField(
              controller: namecon,
              validator: (value) => FormFieldValidators.required(value),
              decoration: InputDecoration(
                hintText: "Enter the name",
                label: Text("Name"),
                border: OutlineInputBorder(),
                
        
              ),
            ),

            SizedBox(height: 15,),
             TextFormField(
              controller: emailcon,
              validator: (value) => FormFieldValidators.email(value),
              decoration: InputDecoration(
                hintText: "Enter the Your Email",
                label: Text("Email"),
                border: OutlineInputBorder()
        
              ),
            ),
                        SizedBox(height: 15,),

             TextFormField(
              controller: passwordcon,
              validator: (value) => FormFieldValidators.password(value),
              decoration: InputDecoration(
                hintText: "Enter your password",
                label: Text("Password"),
                border: OutlineInputBorder()
        
              ),
            ),
                        SizedBox(height: 15,),

        
        
            ElevatedButton(onPressed: (){
             if(globalKey.currentState!.validate()){submit(context);}
        
            }, child: Text("Submit"))
        
        
          ],
        ),
      ),
    );
  }
  void submit(BuildContext context) async {
  final name = namecon.text.trim();
  final email = emailcon.text.trim();
  final password = passwordcon.text.trim();

  if (name.isEmpty || email.isEmpty || password.isEmpty) {
    return;
  }

  final provider = context.read<LoginSignupProvider>();

  await provider.signup(email, password, name);

  if (provider.error == null) {
    Navigator.pop(context);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(provider.error!.errMsg)),
    );
  }
}

}