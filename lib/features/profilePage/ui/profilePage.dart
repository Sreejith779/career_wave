import 'package:flutter/material.dart';
import 'package:job_portel/features/loginPage/googleAuth.dart';
import 'package:job_portel/features/loginPage/ui/loginPage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () async{
          await FirebaseService().googleSignOut();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
          LoginPage()));
        }, child: Text("Log out"),),
      ),
    );

  }
}
