import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_screen/config/loginconfig.dart';
import 'package:login_screen/model/loginmodel.dart';
import 'package:login_screen/view/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService{

var client = http.Client();

Future<LoginModel?> login(LoginModel model, context) async{

var uri = Uri.https(LoginConfig.baseurl,LoginConfig.endpoint);

final response = await client.post(uri,headers: {
  "Content-Type":"application/json"
},body: jsonEncode({
  "mobile":model.mobile,
  'password':model.password,
  'oneSignal':'',
}));

if(response.statusCode==200){
  
 final data=jsonDecode(response.body);

 storetoken(data['data']['token'],context);
 
 
 return LoginModel.fromJson(data["data"]);

}
else{ 
  return null;
}

}

  void storetoken(String token,context) async {

    SharedPreferences pref = await SharedPreferences.getInstance();

    await pref.setString('login', token);

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Homepage()),
        (route) => false);
  }

}