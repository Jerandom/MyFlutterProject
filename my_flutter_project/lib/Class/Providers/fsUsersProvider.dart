import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Firebase/usersDB.dart';
import '../States/fsUsersState.dart';

const String USER_COLLECTION_REF = "users";

class FsUsersProvider extends StateNotifier<FsUsersState> {
  //create an instance of firestore
  final _fireStore = FirebaseFirestore.instance;
  late final CollectionReference _userRef;

  FsUsersProvider() : super(FsUsersState.initial()) {
    // constructor
    _initUserRef();
    _listenToRefChange();
  }

  // initialize ref to follow a structure
  void _initUserRef() {
    _userRef = _fireStore.collection(USER_COLLECTION_REF).withConverter<UsersDB>(
      fromFirestore: (snapshots, _) => UsersDB.fromJson(snapshots.data()!),
      toFirestore: (usersDB, _) => usersDB.toJson(),
    );
  }

  // listener to watch Firestore changes
  void _listenToRefChange() {
    _userRef.snapshots().listen((QuerySnapshot<Object?> snapshot){
      for (var doc in snapshot.docs) {
        print("Document ID: ${doc.id}, Data: ${doc.data()}");
      }
    });
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
