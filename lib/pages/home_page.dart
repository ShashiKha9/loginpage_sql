import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpage_sql/db/login_database.dart';
import 'package:loginpage_sql/model/login.dart';
class HomePageScreen extends StatefulWidget{
  HomePageScreenState createState()=> HomePageScreenState();

}
class HomePageScreenState extends State<HomePageScreen>{
  @override
  void initState(){
    super.initState();
    getData();
  }
  // int? id;
   LoginCredential? credential;
  String email="";
  String? passwd="";


  Future getData() async{
    this.credential= (await  LoginDatabase.instance.read(credential.id)) ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details"),
      ),
      drawer:Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: 60,left: 20),
           child: CircleAvatar(
              backgroundColor: Colors.grey,
             radius: 50,
            ),
            ),
            Padding(padding: EdgeInsets.only(top: 20,left: 20),
          child:  Text(credential!.email,style: TextStyle(fontSize: 16,fontWeight:FontWeight.w700),),
            ),
            Padding(padding: EdgeInsets.only(left: 20,top: 12),
              child:  Text(credential!.passwd,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
            ),

          ],
        ),
      ),
      body: Center(
        child: Text("Home Page",style: TextStyle(fontSize: 22),),
      ),
      
    );
    
  }
}