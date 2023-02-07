// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:halopet/maps/maps.dart';
import 'package:halopet/read%20data/get_clinic_data.dart';


class ClinicsPage extends StatefulWidget {
  const ClinicsPage({Key? key}) : super(key: key);

  @override
  State<ClinicsPage> createState() => _ClinicsPageState();
}

class _ClinicsPageState extends State<ClinicsPage> {
  final user = FirebaseAuth.instance.currentUser!;

  // document IDs
  List<String> docIDs = [];

  // get docIDs
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('clinics').get().then(
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
        'Clinics',
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
                          leading: Icon(Icons.medical_services),
                          title: GetClinicData(clinicId: docIDs[index]),
                          trailing: Icon(Icons.navigate_next_rounded),
                          tileColor: Colors.orange[200],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => maps())
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