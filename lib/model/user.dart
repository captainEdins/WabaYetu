import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String email;
  final String name;
  final String role;
  final bool status;
  final String photoUrl;


  const Users(
      {required this.name,
        required this.status,
        required this.role,
        required this.email,
        required this.photoUrl,
      });

  static Users fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Users(
      name: snapshot["full_name"],
      status: snapshot["status"],
      email: snapshot["email"],
      role: snapshot["role"],
      photoUrl: snapshot["photoUrl"],
    );
  }

  Map<String, dynamic> toJson() => {
    "full_name": name,
    "email": email,
    "role": role,
    "status": status,
    "photoUrl": photoUrl,
  };
}