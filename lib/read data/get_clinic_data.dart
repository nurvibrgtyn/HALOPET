import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetClinicData extends StatelessWidget {
  final String clinicId;

  GetClinicData({required this.clinicId});

  @override
  Widget build(BuildContext context) {

    //get the collection
    CollectionReference clinics = FirebaseFirestore.instance.collection('clinics');

    return FutureBuilder<DocumentSnapshot>(
      future: clinics.doc(clinicId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
          snapshot.data!.data() as Map<String, dynamic>;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${data['clinicname']}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                    '${data['clinicrating']}',
                ),
                Text(
                    '${data['clinicaddress']}',
                ),
                Text(
                  '${data['clinicphone']}',
                ),
              ],
            ),
          );
        }
        return Text('loading...');
      }),
    );
  }
}