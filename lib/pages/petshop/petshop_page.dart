// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:halopet/maps/petshop_map.dart';
import '../../read data/get_petshop_data.dart';


class PetShopPage extends StatefulWidget {
  const PetShopPage({Key? key}) : super(key: key);

  @override
  State<PetShopPage> createState() => _PetShopPageState();
}

class _PetShopPageState extends State<PetShopPage> {
  final user = FirebaseAuth.instance.currentUser!;

  // document IDs
  List<String> docIDs = [];

  // get docIDs
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('petshops').get().then(
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
        'Pet Shops',
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
                          title: GetPetShopData(petshopId: docIDs[index]),
                          tileColor: Colors.orange[200],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => petshop_maps())
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