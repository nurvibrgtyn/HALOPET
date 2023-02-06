import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DoctorSearchPage extends SearchDelegate {
  CollectionReference _firebaseFirestore =
      FirebaseFirestore.instance.collection("doctors");

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }
  
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firebaseFirestore.snapshots().asBroadcastStream(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          else{
            ///Fetch Data here
            print(snapshot.data);
            return ListView(
              children: [
                ...snapshot.data!.docs.where((QueryDocumentSnapshot<Object?> element) => element['doctorname']
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase())).map((QueryDocumentSnapshot<Object?> data) {

                      final String doctorname = data.get('doctorname');
                      final String doctorphoto = data['doctorphoto'];
                      final String doctorprofession = data['doctorprofession'];

                      return ListTile(
                        onTap: () {

                        },
                        title: Text(doctorname),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(doctorphoto),
                        ),
                        subtitle: Text(doctorprofession),
                      );
                    })
              ],
            );
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text("Search Vets here"));
  }
}