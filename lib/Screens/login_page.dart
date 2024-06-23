
// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

//import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:medication_reminder/Screens/home_page.dart';
//import 'package:medication_reminder/Screens/login_page.dart';
import 'package:medication_reminder/Screens/signup_page.dart';
//import 'package:medication_reminder/Services/signup_services.dart';
import 'dart:async';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  Future redirect() async{
  Get.to(()=> (SignupPage()));
  }
  //text controller
  final _userEmailController = TextEditingController();
  final _userPasswordController =  TextEditingController();
  
  Future signIn() async{
    showDialog(context: context, builder:(context){
      return Center(child: CircularProgressIndicator());
    },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _userEmailController.text.trim(),
         password: _userPasswordController.text.trim());
         Navigator.of(context).pop();
         Get.to(()=> HomePage());
         } on FirebaseAuthException {
          Navigator.of(context).pop();
          _showErrorDialog();
    }
  }

  // Show error dialog


  void _showErrorDialog(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Login Failed"),
        content: Text('Wrong Email id or Password'),
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).pop();
            },
             child:Text('ok')),
        ],
      );


    },);

  }

  

  bool _isPasswordVisible = false;
  void _togglePasswordVisiblity(){
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(223, 255, 154, 238),
      body: SafeArea(
        child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  //Animation & welcome msg
                  Lottie.asset('assets/nurse1.json', height: 200,
                  ),
                  SizedBox(height: 20,),
                  Text("Your Personal Nurse is here",
                  style:GoogleFonts.bebasNeue(
                    fontSize: 30
                  ),
                    ),
                    SizedBox(height: 20,),

                    //email  

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15,top: 7, bottom: 7 ),
                          child: TextFormField(
                            controller: _userEmailController,
                            decoration: InputDecoration(
                              hintText: "Email",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),

                    //password

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15,top: 7, bottom: 7 ),
                          child: TextFormField(
                            controller: _userPasswordController,
                            obscureText: !_isPasswordVisible,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(_isPasswordVisible?
                                 Icons.visibility:
                                 Icons.visibility_off,),
                                onPressed: _togglePasswordVisiblity,
                                ),
                              hintText: "Password",
                              border: InputBorder.none
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    //signup

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GestureDetector(
                        onTap: signIn,
                        child: Container(
                        decoration: BoxDecoration(
                          color: Colors.pink[400],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text("Sign In",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                              ),
                          ),
                        ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),





                    //Login toggle
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ 
                        Text("Wannan join us?",
                        style: TextStyle(fontSize: 16, 
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                        ),
                        ),
                        SizedBox(width: 5,),
                        GestureDetector(
                          onTap: redirect,
                          child: Text('Register Now!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black
                          )
                          ),
                        ),
                        
                      ]
                    )
                ],
              ),
            ),
          ),
      )


    );
  }
}