import 'package:flutter/material.dart';
import 'package:halopet/pages/doctors/doctor_details.dart';

class DoctorCard extends StatelessWidget {

  final String doctorImagePath;
  final String rating;
  final String doctorName;
  final String doctorProfession;

  DoctorCard({
    required this.doctorImagePath,
    required this.rating,
    required this.doctorName,
    required this.doctorProfession,
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: GestureDetector(
        onTap:(){
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>DoctorDetailsPage()));
        },
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.orange[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              // vet picture
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  doctorImagePath,
                  height: 100,
                ),
              ),
              SizedBox(
                height: 10,
              ),

              // rating out of 5
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.deepOrange,
                  ),
                  Text(
                    rating,
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),

              // vet name
              Text(
                doctorName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              // vet title
              Text(doctorProfession + ' 10 y.e.'),
            ],

          ),
        ),
      ),
    );
  }
}