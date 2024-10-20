// class FirebaseApi{
//     //create an instance of Firebase Messaging
//     final _firebaseMessaging = FirebaseMessaging.instance;
//
//     //function to initialize notification
//     Future<void> initNotification() async {
//         //request permission from user [will prompt user]
//         await _firebaseMessaging.requestPermission();
//
//         //fetch the FCM token for this device
//         final fcmToken = await _firebaseMessaging.getToken();
//
//         //print the token (normally you would send this to your server)
//         print("Token: " $fcmToken);
//     }
// }
