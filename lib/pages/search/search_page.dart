// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:halopet/maps/petshop_map.dart';
import 'package:halopet/util/search_card.dart';

import '../../maps/maps.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 25),

            /// card here
            SearchCard(
                iconImagePath: 'image/stethoscope.png',
                categoryName: 'CLINICS',
                categoryDesc: 'Search for nearest clinics',
                pageCard: maps(),
            ),

            SearchCard(
              iconImagePath: 'image/pet-shop.png',
              categoryName: 'PETSHOP',
              categoryDesc: 'Search for nearest Pet Shops',
              pageCard: petshop_maps(),
            ),
          ],
        ),
      ),
    );

  }
}