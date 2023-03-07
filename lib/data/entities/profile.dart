import 'package:cloud_firestore/cloud_firestore.dart';


class Profile {
  final String uid;
  final String? name;
  final int? age;
  final String? city;
  final String? country;
  final String imagen;

  //final List<String>? friends;
  //final List<DocumentReference>? rooms;


  Profile({
    this.uid = "",
    this.name="",
    this.age=0,
    this.city="",
    this.country="",
    this.imagen="",
    //this.friends = const [],
    //this.rooms = const [],

  });

  factory Profile.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ){
    final data = snapshot.data();
    return Profile(
      uid: snapshot.id,
      name: data?['name'],
      age: data?['age'],
      city: data?['city'],
      country: data?['country'],
      imagen: data?['imagen'],
      //friends: data?['friends'] is Iterable ? List.from(data?['friends']) : null,
      //rooms: data?['rooms'] is Iterable ? List.from(data?['rooms']) : null
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (age != null) "age": age,
      if (name != null) "name": name,
      if (city != null) "city": city,
      if (country != null) "country": country,
      if(imagen != null) "imagen": imagen,
      //if (friends!.isNotEmpty) "friends": friends,
      //if (rooms!.isNotEmpty) "rooms": rooms,
    };
  }
}