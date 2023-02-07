// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:halopet/pages/doctors/doctor_details.dart';
import 'package:halopet/read%20data/get_doctor_data.dart';


class DoctorPage extends StatefulWidget {
  const DoctorPage({Key? key}) : super(key: key);

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  final user = FirebaseAuth.instance.currentUser!;

  // document IDs
  List<String> docIDs = [];

  // get docIDs
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('doctors').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            docIDs.add(document.reference.id);
            },
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Our Vets',
          style: TextStyle(
              fontSize: 25,
          color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 25),
            Expanded(
              child: FutureBuilder(
                future: getDocId(),
                builder: (context, snapshot){
                  return ListView.builder(
                    itemCount: docIDs.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Icon(Icons.medical_information_outlined),
                          title: GetDocData(doctorId: docIDs[index]),
                          trailing: Icon(Icons.navigate_next_rounded),
                          tileColor: Colors.orange[200],
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DoctorDetailsPage())
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}