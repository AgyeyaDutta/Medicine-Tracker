// ignore_for_file: prefer_const_constructors

import "package:firebase_auth/firebase_auth.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:medication_reminder/Screens/login_page.dart';


//signup users

signUpUser(
  String userName,
  String userEmail,
  String userPassword,
) {
  User? userid = FirebaseAuth.instance.currentUser;

try{
        FirebaseFirestore.instance.collection("Users").doc(userid!.uid).set({
          'userName': userName,
          'userEmail': userEmail,
          'createdAt': DateTime.now(),
          'userId': userid.uid,
          }).then((value)=>{
            FirebaseAuth.instance.signOut(),
            Get.offAll(()=>LoginPage()),
            });
}  on FirebaseAuthException catch(e){
  throw ('Error $e');
}
} 


//logout users

signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => LoginPage());
  }

