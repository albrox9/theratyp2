import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theratyp/data/auth/admin_data.dart';
import 'package:theratyp/data/data_holder.dart';
import 'package:theratyp/data/entities/profile.dart';
import 'package:theratyp/ui/pages/user_screen/edit_profile.dart';
import 'package:theratyp/ui/pages/user_screen/list_item.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {

  FirebaseFirestore _db = DataHolder().db;
  FirebaseAuth _auth = DataHolder().auth;
  Profile profile = DataHolder().profile;

  //Recupero el perfil del usuario.
  void getData() async {
    final ref =
        _db.collection("profiles").doc(_auth.currentUser?.uid).withConverter(
              fromFirestore: Profile.fromFirestore,
              toFirestore: (Profile profile, _) => profile.toFirestore(),
            );

    final docSnap = await ref.get();
    profile = docSnap.data()!;
    setState(() {}); //Necesito el setState para que me actualice los datos, si los cambio.

    if (profile != null) {
      print("-----" + profile.name.toString());
    } else {
      print("No such document.");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(); //Llamo al metodo en el init state, para que me cargue los dtos del perfil.
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2));

    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(profile.imagen),
                    radius: 43,
                  ),
                  Text(
                    profile.name!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          ListItem(
            text: "Edit Profile",
            icon: Icons.person_3,
            onTap: () {
              Navigator.popAndPushNamed(context, '/edit_profile');
            },
          ),
          ListItem(
            text: "Search",
            icon: Icons.search_rounded,
            onTap: () {
              //TODO GUARDAR UNA LISTA CON LAS BUSQUEDAS QUE REALIZA EL USUARIO
            },
          ),
          ListItem(
            text: "Favorites",
            icon: Icons.favorite,
            onTap: () {
              //TODO GUARDAR LOS VIDEOS FAVORITOS DEL USUARIO DONDE HAGA UN LONGPRESS.
            },
          ),
          ListItem(
            text: "Log Out",
            icon: Icons.exit_to_app,
            onTap: () {
              AdminData().singOut(context); //nos desloguea estemos con email o con google.
            },
          ),
        ],
      ),
    );
  }
}
