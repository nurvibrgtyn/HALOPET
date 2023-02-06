import 'package:flutter/material.dart';
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
          'Contact Us',
          style: TextStyle(fontSize: 16),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: MaterialButton(
          onPressed: () async {},
          color: Colors.orange,
          child: Text('Send Message',
          style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}