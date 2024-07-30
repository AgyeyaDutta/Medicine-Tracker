// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:medication_reminder/Screens/Patients.dart';
import 'package:medication_reminder/Screens/profile.dart';
import 'package:medication_reminder/Services/signup_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int _selectedIndex = 0;

//list of screens that we want to navigate between

List<Widget> _screens = [
  HomePage(),
  PatientPage(),
  ProfilePage()
];


// creating patient in firebase

  TextEditingController _patientName = TextEditingController();
  TextEditingController _patientAge = TextEditingController();
  User? userId = FirebaseAuth.instance.currentUser;

  void _addPatientData(context) async{
    try {
      await FirebaseFirestore.instance.collection("Patient_Data").doc().set({
        "patient_name": _patientName.text,
        "patient_age": _patientAge.text,
        "userId": userId?.uid,
      });

      //show snacbar for success
       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Patient data added successfully!')),
      );
       _patientName.clear();
      _patientAge.clear();
      
      } catch (error) {

      // Show error snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add into Database: $error')),
      );
    }
  }
   void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // You can handle navigation to different screens based on the index
      // For now, we are just updating the selected index
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
      actions: [
        IconButton(onPressed: signOut ,   
        icon: Icon(Icons.logout),
        tooltip: 'signOut',)
      ],
      backgroundColor: Colors.purple
      ),
       body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient (
            colors:[Color.fromARGB(255, 240, 50, 113), Colors.purple],
            begin: Alignment.center,
            end: Alignment.topCenter,
            tileMode: TileMode.mirror
          ),
        ),
      child: Center( 
        child: _selectedIndex == 0
            ? 
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
  
  //adding patients details

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, top: 7, bottom: 7),
                        child: TextFormField(
                          controller: _patientName,
                          decoration: InputDecoration(
                            hintText: "Patient Name",
                            hintStyle: GoogleFonts.anta(fontSize: 15),
                            border: InputBorder.none
                          ),
                        ),
                      ),
                  ),
                ),
  
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, top: 7, bottom: 7),
                      child: TextFormField(
                        controller: _patientAge,
                        decoration: InputDecoration(
                          hintText: "Age",
                          hintStyle: GoogleFonts.anta(fontSize: 15),
                          border: InputBorder.none
                        ),
                      ),
                    ),
                  ),
                ),

               // Button

                FloatingActionButton.extended
                (onPressed: () => _addPatientData(context),
                label: Text("Create Profile"),
                extendedTextStyle: GoogleFonts.anta(fontSize: 15),
                ),

                
            
          ],

        )
        : Center(child: Scaffold(
          body: _screens [_selectedIndex],
        )),
      )
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.purple,
        color: Colors.purple.shade600,
        animationCurve: Curves.ease,
        animationDuration: Duration(milliseconds: 300),
        
        items: [
        Icon(Icons.home),
        Icon(Icons.people_sharp),
        Icon(Icons.person_3),],
      onTap: _onItemTapped,
      ),
      
      //  bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.people_sharp),
      //       label: 'Patients',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person_pin_rounded),
      //       label: 'Profile',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      // ),
      





    );
  }
}