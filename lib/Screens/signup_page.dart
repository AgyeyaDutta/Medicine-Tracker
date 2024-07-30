// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:medication_reminder/Screens/login_page.dart';
import 'package:medication_reminder/Services/signup_services.dart';
import 'dart:async';


class SignupPage extends StatefulWidget {
  const SignupPage ({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();

}
class _SignupPageState extends State<SignupPage>{

  Future redirect() async{
  Get.offAll(()=> (LoginPage()));
  }
  Future signUp() async{
   var userName = userNameController.text.trim();
   var userEmail = userEmailController.text.trim();
   var userPassword = userPasswordController.text.trim();

   
   try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: userEmail , password: userPassword).then((value)=>{
      signUpUser(userName, userEmail, userPassword,)});
      await redirect(); 

      showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Text("Welcome aboard!!!"),
      content: Text('Please LogIn '),
      actions: [
        TextButton(onPressed: (){
        Navigator.of(context).pop();
        },
         child: Text('ok'))
      ],
    );
    
  },
  );


      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Patient data added successfully!')),
      // );
      }
      
    catch (e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to SignUP, enter the correct format')),
      );
    }
  }

  //text controllers

  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  bool _isPasswordVisible = false;

  void _togglePasswordVisiblity(){
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
      
    });
  }
  
  User? currentUser = FirebaseAuth.instance.currentUser;

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

                    //user details
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
                            controller: userNameController,
                            decoration: InputDecoration(
                              hintText: 'Username',
                              border: InputBorder.none
                            ),
                          ),
                        ),
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
                            controller: userEmailController,
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
                            controller: userPasswordController,
                            obscureText: !_isPasswordVisible,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(_isPasswordVisible?
                                 Icons.visibility:
                                 Icons.visibility_off,),
                                onPressed: _togglePasswordVisiblity,
                                ),
                              hintText: "Password, atleast 7 characters",
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
                        onTap: signUp,
                        child: Container(
                        decoration: BoxDecoration(
                          color: Colors.pink[400],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text("SignUp",
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
                        Text("Already an user?",
                        style: TextStyle(fontSize: 16, 
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                        ),
                        ),
                        SizedBox(width: 5,),
                        GestureDetector(
                          onTap: redirect,
                         // (){Get.offAll(()=> LoginPage());},
                          child: Text('Log in',
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