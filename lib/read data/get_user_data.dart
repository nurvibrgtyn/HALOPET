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
                  'First Name : ',
                  style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                ),
                Text(
                  '${data['first name']}',
                ),
                Text(
                    '\nLast Name : ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                ),
                Text(
                    '${data['last name']}',
                ),
                Text(
                    '\ne-mail : ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                ),
                Text(
                  '${data['email']}',
                ),
                Text(
                  '\nPhone Number : ',
                  style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
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