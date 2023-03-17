import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String email;
  final String name;
  final String role;
  final bool status;
  final String photoUrl;
  final String bio;
  final String lat;
  final String long;
  final String shopName;
  final String location;
  final String phone;




  const Users(
      {required this.name,
        required this.status,
        required this.role,
        required this.email,
        required this.photoUrl,
        required this.bio,
        required this.lat,
        required this.long,
        required this.shopName,
        required this.location,
        required this.phone,
      });

  static Users fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Users(
      name: snapshot["full_name"],
      status: snapshot["status"],
      email: snapshot["email"],
      role: snapshot["role"],
      photoUrl: snapshot["photoUrl"],
      bio: snapshot["bio"],
      lat: snapshot["lat"],
      long: snapshot["long"],
      shopName: snapshot["shopName"],
      location: snapshot["location"],
      phone: snapshot["phone"],
    );
  }

  Map<String, dynamic> toJson() => {
    "full_name": name,
    "email": email,
    "role": role,
    "status": status,
    "photoUrl": photoUrl,
    "bio": bio,
    "lat": lat,
    "long": long,
    "shopName": shopName,
    "location": location,
    "phone": phone,
  };
}