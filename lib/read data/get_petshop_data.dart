import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetPetShopData extends StatelessWidget {
  final String petshopId;

  GetPetShopData({required this.petshopId});

  @override
  Widget build(BuildContext context) {

    //get the collection
    CollectionReference clinics = FirebaseFirestore.instance.collection('petshops');

    return FutureBuilder<DocumentSnapshot>(
      future: clinics.doc(petshopId).get(),
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
                  '${data['petshopname']}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                    '${data['petshoprating']}',
                ),
                Text(
                    '${data['petshopaddress']}',
                ),
                Text(
                  '${data['petshopphone']}',
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