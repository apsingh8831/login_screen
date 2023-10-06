import 'package:flutter/material.dart';
import 'package:login_screen/provider/loginprovider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


   @override
  void initState() {
    super.initState();
    isalreadylogin();
  }

  void isalreadylogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    String? val = pref.getString('login');

    if (val != null) {
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Homepage()),
          (route) => false);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                onChanged: (value) {
                  Provider.of<LoginProvider>(context, listen: false)
                      .setMobile(value);
                },
                decoration: const InputDecoration(hintText: "Mobile No."),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                onChanged: (value) {
                  Provider.of<LoginProvider>(context, listen: false)
                      .setPassword(value);
                },
                decoration: const InputDecoration(hintText: "Password"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    Provider.of<LoginProvider>(context, listen: false)
                        .postDataProvider(context);
                  },
                  child: const Text("Login")),
              const SizedBox(
                height: 20,
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
