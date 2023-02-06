import 'package:flutter/material.dart';
import 'package:halopet/pages/account/account.dart';
import 'package:firebase_auth/firebase_auth.dart';


class DoctorDetailsPage extends StatefulWidget {
  const DoctorDetailsPage({Key? key}) : super(key: key);

  @override
  State<DoctorDetailsPage> createState() => _DoctorDetailsPageState();
}

class _DoctorDetailsPageState extends State<DoctorDetailsPage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.email!,
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            child: Icon(Icons.logout),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
        ),
      ),
    );
  }
}