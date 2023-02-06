// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:halopet/pages/clinics/clinics_page.dart';
import 'package:halopet/pages/doctors/doctor_page.dart';
import 'package:halopet/pages/petshop/petshop_page.dart';
import 'package:halopet/pages/wiki/wiki_page.dart';
import 'package:halopet/util/category_card.dart';
import 'package:halopet/util/doctor_card.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 8),
            //app bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello,',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        user.email!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                        ),
                      ),

                    ],
                  ),

                  // profile picture
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.orange[300],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Icon(Icons.person),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),

            //card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(children: [
                  //animation or picture
                  Container(
                    height: 100,
                    width: 100,
                    child: Image.asset("image/veterinarian.png"),
                  ),
                  SizedBox(
                    width: 20,
                  ),

                  //how do you feel + button
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'How are they?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Fill out your pet medical card right now',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 12),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              'Get Started',
                              style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ),

            SizedBox(height: 25),

            ///search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    hintText: 'How can we help?',
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),

            //horizontal listview
            Container(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryCard(
                    categoryName: 'Cat',
                    iconImagePath: 'image/cat.png',
                    pageCard: WikiPage(),
                  ),
                  CategoryCard(
                    categoryName: 'Dog',
                    iconImagePath: 'image/dog.png',
                    pageCard: WikiPage(),
                  ),
                  CategoryCard(
                    categoryName: 'Clinic',
                    iconImagePath: 'image/stethoscope.png',
                    pageCard: ClinicsPage(),
                  ),
                  CategoryCard(
                    categoryName: 'Pet Shop',
                    iconImagePath: 'image/pet-shop.png',
                    pageCard: PetShopPage(),
                  ),
                ],
              ),
            ),

            SizedBox(height: 25),

            //doctor list\\
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Vet List',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500],
                      ),
                    ),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>DoctorPage()));
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 25),

            Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    DoctorCard(
                      doctorImagePath: 'image/doctor.jpg',
                      rating: '4.9',
                      doctorName: 'Doctor Strange',
                      doctorProfession: 'Surgeon',
                    ),
                    DoctorCard(
                      doctorImagePath: 'image/doctor1.jpg',
                      rating: '4.5',
                      doctorName: 'Stacy R. Azar',
                      doctorProfession: 'Vet',
                    ),
                    DoctorCard(
                      doctorImagePath: 'image/doctor2.jpg',
                      rating: '4.4',
                      doctorName: 'Martin R. Helms',
                      doctorProfession: 'Surgeon',
                    ),
                    DoctorCard(
                      doctorImagePath: 'image/doctor3.jpg',
                      rating: '4.7',
                      doctorName: 'Chae J. Corey',
                      doctorProfession: 'Vet',
                    ),
                  ],
                )),

          ],
        ),
      ),
    );

  }
}