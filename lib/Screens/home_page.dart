// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medication_reminder/Screens/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => LoginPage());
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(223, 255, 154, 238),
      appBar: AppBar(
      actions: [
        IconButton(onPressed: signOut , 
        icon: Icon(Icons.logout),
        tooltip: 'signOut',)
      ],
      backgroundColor: Color.fromARGB(223, 255, 154, 238),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                //adding patients name
                Text('Test',
                style: GoogleFonts.bebasNeue(fontSize: 42),),

                
            
          ],

        ),
        
      )




    );
  }
}