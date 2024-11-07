import 'package:cloud_firestore/cloud_firestore.dart';

const String USER_COLLECTION_REF = "users";

class FirebaseApi{
    // //create an instance of Firebase Messaging
    // final _firebaseMessaging = FirebaseMessaging.instance;

    // //function to initialize notification
    // Future<void> initNotification() async {
    //     //request permission from user [will prompt user]
    //     await _firebaseMessaging.requestPermission();

    //     //fetch the FCM token for this device
    //     final fcmToken = await _firebaseMessaging.getToken();

    //     //print the token (normally you would send this to your server)
    //     print("Token: " $fcmToken);
    // }

    //create an instance of firestore
    final _firestore = FirebaseFirestore.instance;
    late final CollectionReference _userRef;

    //constructor
    FirebaseApi() {
        _userRef = _firestore.collection(USER_COLLECTION_REF).withConverter<UsersDB>(
            fromFirestore: (snapshots, _) => UsersDB.fromJson(snapshots.data()!),
            toFirestore: (UsersDB, _) => UsersDB.toJson(),
        );
    }

    // Method to get data from Firestore
    Stream<QuerySnapshot<UsersDB>> getUsers() {
        return _userRef.snapshots();
    }

    // Method to add data to Firestore
    Future<void> addUser(UsersDB usersDB) async {
        await _userRef.add(usersDB);
    }
}
