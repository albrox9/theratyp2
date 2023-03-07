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

  bool enabledBoton() {
    bool enabled = false;
    (_name.text.length > 1 &&
            _age.text.length > 1 &&
            _city.text.length > 1 &&
            _country.text.length > 1)
        ? enabled = true
        : enabled = false;
    return enabled;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isProfile();


  }

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
        child: SingleChildScrollView(
          padding: MediaQuery.of(context).padding,
          //Evita que el teclado tape los input.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 62.0,
                backgroundImage: NetworkImage(imageUrl),
              ),
              IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () {
                    AdminData().pickUploadImage().then((value) {
                      setState(() {
                        imageUrl = value;
                      });
                    });
                  }),
              InputText(
                controller: _name,
                shintText: 'Enter the Username',
                bObscureText: false,
                icon: Icons.alternate_email,
              ),
              InputText(
                controller: _age,
                shintText: 'Enter your age with number',
                bObscureText: false,
                icon: Icons.person_3,
              ),
              InputText(
                controller: _city,
                shintText: 'Enter your city',
                bObscureText: false,
                icon: Icons.location_city,
              ),
              InputText(
                controller: _country,
                shintText: 'Enter yout country',
                bObscureText: false,
                icon: Icons.place,
              ),
              Button(
                  onTap: () {
                    if (enabledBoton()) {
                      setState(() {
                        AdminData().insertProfile(
                            _name.text,
                            int.parse(_age.text),
                            _city.text,
                            _country.text,
                            imageUrl,
                            context);
                      });
                    } else {
                      null;
                    }
                  },
                  name: 'Update Profile'),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> isProfile() async {

    bool pExist = await AdminData().isGetProfile();

    if (pExist) {
      setState(() {
        Navigator.of(context).popAndPushNamed("/home_view");
      });
    } else {
      setState(() {
        Navigator.of(context).popAndPushNamed("/edit_profile");
      });
    }
  }
}
