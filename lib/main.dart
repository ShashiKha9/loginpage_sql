  import 'package:flutter/material.dart';
import 'package:loginpage_sql/db/login_database.dart';
import 'package:loginpage_sql/model/login.dart';
import 'package:loginpage_sql/pages/home_page.dart';

void main() {
  runApp(MaterialApp(
      home:LoginPageScreen()));
}
class LoginPageScreen extends StatefulWidget{
  LoginPageScreenState createState()=> LoginPageScreenState();
}

class LoginPageScreenState extends State<LoginPageScreen> {


  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();


  Future addData() async {

  int i = await  LoginDatabase.instance.create(LoginCredential(
      email: emailController.text,
      passwd: passController.text));
      //create data of tables
      print(i);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Column(
        children: [
          Padding(padding:EdgeInsets.all(20),
         child: TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: "email",

            ),
           validator: (value){
              if(value!.isEmpty){
                return "Please enter the name";
              }
           },
          ),
          ),
          //
          Padding(padding: EdgeInsets.all(20),
         child: TextFormField(
            controller: passController,
            decoration: InputDecoration(
              hintText: "Password",
            ),
           validator: (value){
             if(value!.isEmpty){
               return "Please enter the password";
             }
           },
          ),
          ),
          ElevatedButton(onPressed: (){
            addData();
            if(_formkey.currentState!.validate()){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePageScreen()));
            }

          }, child: Text("Login"))
        ],
      ),
      )
    );

  }


}
