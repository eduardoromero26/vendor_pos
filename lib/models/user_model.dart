// import 'package:cloud_firestore/cloud_firestore.dart';

// class User {
//   String uid;
//   String displayName;
//   String email;
//   String mobile;
//   Timestamp createdAt;
//   String imageURL;
//   int token;

//   User({
//     required this.uid,
//     required this.displayName,
//     required this.email,
//     required this.mobile,
//     required this.createdAt,
//     required this.imageURL,
//     required this.token,
//   });

//   factory User.fromFirestore(DocumentSnapshot doc) {
//     final data = doc.data() as Map;
//     return User(
//       uid: data['uid'],
//       displayName: data['displayName'],
//       email: data['email'],
//       mobile: data['mobile'],
//       createdAt: data['createdAt'],
//       imageURL: data['imageURL'],
//       token: data['token'],
//     );
//   }
// }
