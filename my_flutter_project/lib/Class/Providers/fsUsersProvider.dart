import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const String USER_COLLECTION_REF = "users";

class FsUsersProvider extends StateNotifier<FsUsersState> {
    //create an instance of firestore
    final _firestore = FirebaseFirestore.instance;
    late final CollectionReference _userRef;

    FsUsersProvider() : super (FsUsersState.initial()) {
        // constructor
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
    Future<void> addUser(UsersDB usersState) async {
        await _userRef.add(usersState);
    }
}

// Define a provider for the FsUsersProvider
final fsUsersProvider = StateNotifierProvider<FsUsersProvider, FsUsersState>((ref) {
    return FsUsersProvider();
});