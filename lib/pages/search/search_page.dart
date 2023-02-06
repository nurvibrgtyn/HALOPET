// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:halopet/pages/doctors/doctor_page.dart';
import 'package:halopet/pages/petshop/petshop_page.dart';
import 'package:halopet/pages/search/doctor_search_page.dart';
import 'package:halopet/pages/vaccine/vaccine_page.dart';
import 'package:halopet/pages/wiki/wiki_page.dart';
import 'package:halopet/util/category_card.dart';
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
              pageCard: PetShopPage(),
            ),
          ],
        ),
      ),
    );

  }
}