
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpage_sql/db/login_database.dart';
import 'package:loginpage_sql/main.dart';
import 'package:loginpage_sql/model/login.dart';
class HomePageScreen extends StatefulWidget{
  HomePageScreenState createState()=> HomePageScreenState();

}
class HomePageScreenState extends State<HomePageScreen>{
 List<LoginCredential>  data=[];
  bool isLoading = true;
  @override
  void initState(){
    super.initState();
    getData();
  }

  Future getData() async{
   this.data=await  LoginDatabase.instance.read() ;
   print(data);
   setState(() => isLoading = false);


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
             child: Icon(CupertinoIcons.person),
              backgroundColor: Colors.grey,
             radius: 50,
            ),
            ),
        Padding(padding: EdgeInsets.only(top: 20,left: 20),
          child:  Text(data[0].email,style: TextStyle(fontSize: 16,fontWeight:FontWeight.w700),),
            ),
            Padding(padding: EdgeInsets.only(left: 20,top: 12),
              child:  Text(data[0].passwd,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
            ),

            Padding(padding: EdgeInsets.only(left: 20,top: 20),
           child: TextButton(onPressed: () async {
            await  LoginDatabase.instance.delete();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPageScreen()));
              
            }, child: Text("Logout"))
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