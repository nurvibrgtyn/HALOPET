import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetDocData extends StatelessWidget {
  final String doctorId;

  GetDocData({required this.doctorId});

  @override
  Widget build(BuildContext context) {

    //get the collection
    CollectionReference doctors = FirebaseFirestore.instance.collection('doctors');

        return FutureBuilder<DocumentSnapshot>(
          future: doctors.doc(doctorId).get(),
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
                      'Dr. ' + '${data['doctorname']}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '${data['doctorprofession']}' +
                        ', 10 years experience'
                    ),
                    Text(
                      '${data['doctorrating']}'
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