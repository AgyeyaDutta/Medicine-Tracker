//ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage ({super.key});

  @override
  State<ProfilePage> createState() => _PatientPageState();

}


class _PatientPageState extends State<ProfilePage>{


@override
  Widget build(BuildContext context){
    return  Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color.fromARGB(255, 240, 50, 113), Colors.purple],
            begin: Alignment.center,
            end: Alignment.topCenter,
            tileMode: TileMode.mirror
            ),
          ),
  
          )
      



    );
  }


}