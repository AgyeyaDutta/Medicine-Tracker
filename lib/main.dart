import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
//import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:medication_reminder/Screens/signup_page.dart';
import 'firebase_options.dart';


Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();  
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupPage(),
    );
  }
}