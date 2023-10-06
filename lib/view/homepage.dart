import 'package:flutter/material.dart';
import 'package:login_screen/provider/loginprovider.dart';
import 'package:login_screen/view/loginpage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:const Text("Homepage")),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Consumer<LoginProvider>(builder: (context,value,child){
          return Text(value.mobile??"Mobile No.");
          }),
          const SizedBox(height: 20,),
           ElevatedButton(onPressed: (){
           Provider.of<LoginProvider>(context,listen: false).logout(context);
           }, child: const Text("Logout"))
      ],)),
    );
  }


 
}