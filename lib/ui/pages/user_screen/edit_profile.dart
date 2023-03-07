
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:theratyp/ui/widget/button.dart';

import '../../../data/auth/admin_data.dart';
import '../../../data/data_holder.dart';
import '../../widget/input_text.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _name = TextEditingController();

  final _age = TextEditingController();

  final _city = TextEditingController();

  final _country = TextEditingController();

  String imageUrl = ' ';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          'Welcome to TheraTyp',
          style: TextStyle(color: Colors.grey),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: MediaQuery.of(context).padding,
          //Evita que el teclado tape los input.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              IconButton(icon: const Icon(Icons.camera_alt),
                  onPressed: () {
                    AdminData().pickUploadImage().then((value) => imageUrl);
                  }),
              CircleAvatar(
                radius: 62.0,
                //backgroundImage:
              ),
              InputText(
                controller: _name,
                shintText: 'Username',
                bObscureText: false,
                icon: Icons.alternate_email,
              ),
              InputText(
                controller: _age,
                shintText: 'Your Age',
                bObscureText: false,
                icon: Icons.person_3,
              ),
              InputText(
                controller: _city,
                shintText: 'Your city',
                bObscureText: false,
                icon: Icons.location_city,
              ),
              InputText(
                controller: _country,
                shintText: 'Country',
                bObscureText: false,
                icon: Icons.place,
              ),
              Button(onTap: () {
                AdminData().insertProfile(_name.text, int.parse(_age.text), _city.text, _country.text, imageUrl, context);
              }, name: 'Update Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
