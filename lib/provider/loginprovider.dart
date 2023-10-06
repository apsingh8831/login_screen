import 'package:flutter/material.dart';
import 'package:login_screen/model/loginmodel.dart';
import 'package:login_screen/service/loginservice.dart';
import 'package:login_screen/view/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier{

 LoginModel? _loginModel;

 LoginModel? get loginmodel=>_loginModel;

 String? _mobile;
 String? get mobile=>_mobile;



 LoginProvider(){
 _loginModel =const LoginModel();

 }

 postDataProvider(context) async{

 final data = await LoginService().login(_loginModel!,context);

 _mobile=data!.mobile;

 notifyListeners();

 }



 setMobile(String mobile){
  _loginModel=_loginModel!.copyWith(mobile: mobile);
  notifyListeners();
 }

 setPassword(String password){
  _loginModel=_loginModel!.copyWith(password: password);
  notifyListeners();
 }

   void logout(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    await pref.clear();
    // ignore: use_build_context_synchronously
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (route) => false);

        notifyListeners();
  }

}