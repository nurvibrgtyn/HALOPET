import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:halopet/auth/auth_page.dart';
import 'package:halopet/config/widget.dart';
import 'package:halopet/pages/account/account.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:halopet/util/app_colors.dart';
import 'package:image_picker/image_picker.dart';


class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController homeController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              height: Get.height*0.4,

              child: Stack(
                children: [
                  introWidgetWithoutLogos(),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 120,
                      height: 120,
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffD6D6D6)
                      ),
                      child: Center(child: Icon(Icons.camera_alt_outlined, size: 40, color: Colors.white,)),
                    ),
                  ),

                ], 
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                children: [
                  TextFieldWidget('First Name',Icons.person_outlined,firstnameController),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget('Last Name',Icons.person_outlined,firstnameController),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget('e-mail',Icons.email_outlined,emailController),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget('Phone',Icons.phone_android_outlined,phoneController),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget('Address',Icons.home_outlined,homeController),
                  const SizedBox(
                    height: 30,
                  ),
                  orangeButton('Submit', (){}),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }

  Widget TextFieldWidget(String title, IconData iconData, TextEditingController controller){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w600),),
        const SizedBox(
          height: 6,
        ),
        Container(
          width: Get.width,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 1,
                blurRadius: 1
              )
            ],
            borderRadius: BorderRadius.circular(8)
          ),
          child: TextField(
            decoration: InputDecoration(

            ),
          ),
        ),
      ],
    );
  }

  Widget orangeButton(String title,Function onPressed){
    return MaterialButton(
      minWidth: Get.width,
      height: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5)
      ),
      color: AppColors.orangeColor,
      onPressed: () =>onPressed(),
      child: Text(title,style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.bold),)
    );
  }
}