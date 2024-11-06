// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import '../States/firebaseState.dart';
//
// const String USER_COLLECTION_REF = "users";
//
// class FirebaseApi{
//     // //create an instance of Firebase Messaging
//     // final _firebaseMessaging = FirebaseMessaging.instance;
//
//     // //function to initialize notification
//     // Future<void> initNotification() async {
//     //     //request permission from user [will prompt user]
//     //     await _firebaseMessaging.requestPermission();
//
//     //     //fetch the FCM token for this device
//     //     final fcmToken = await _firebaseMessaging.getToken();
//
//     //     //print the token (normally you would send this to your server)
//     //     print("Token: " $fcmToken);
//     // }
//
//     //create an instance of firestore
//     final _firestore = FirebaseFirestore.instance;
//     late final CollectionReference _userRef;
//
//     //constructor
//     FirebaseApi() {
//         _userRef = _firestore.collection(USER_COLLECTION_REF).withConverter<FirebaseState>(
//             fromFirestore: (snapshots, _) => FirebaseState.fromJson(
//                 snapshots.data()!,
//             ),
//             toFirestore: (firebaseState, _) => firebaseState.toJson()
//         );
//     }
//
//     //get data from firestore
//     Stream<QuerySnapshot> getUsers() {
//         return _userRef.snapshots();
//     }
//
//     //add data to firestore
//     void addUsers(FirebaseState firebaseState) async {
//         _userRef.add(firebaseState);
//     }
// }
