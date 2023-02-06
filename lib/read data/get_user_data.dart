import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserData extends StatelessWidget {
  final String userId;

  GetUserData({required this.userId});

  @override
  Widget build(BuildContext context) {

    //get the collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(userId).get(),
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
                  '${data['first name']}',
                ),
                Text(
                    '${data['last name']}',
                ),
                Text(
                    '${data['email']}',
                ),
                Text(
                  '${data['phone']}',
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