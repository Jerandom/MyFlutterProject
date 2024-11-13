import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Firebase/usersDB.dart';
import '../States/fsUsersState.dart';

const String USER_COLLECTION_REF = "users";

class FsUsersProvider extends StateNotifier<FsUsersState> {
  //create an instance of fire store
  final _fireStore = FirebaseFirestore.instance;
  late final CollectionReference _userRef;

  FsUsersProvider() : super(FsUsersState.initial()) {
    // constructor
    _initUserRef();
    _listenToRefChange();
  }

  // initialize ref to follow a structure
  void _initUserRef() {
    _userRef = _fireStore.collection(USER_COLLECTION_REF);
  }

  // listener to watch Fire store changes
  void _listenToRefChange() {
    _userRef.snapshots().listen((QuerySnapshot<Object?> snapshot) {
      final Map<String, UsersDB> newUsers = {
        for (var doc in snapshot.docs)
          doc.id: UsersDB.fromJson(doc.data() as Map<String, dynamic>)
      };

      // Update the state with the new map of users
      state = state.copyWith(setUsers: newUsers);

      print(newUsers);
    });
  }

  // Method to add data to Fire store
  Future<void> addUser(UsersDB usersState) async {
    await _userRef.add(usersState);
  }
}

// Define a provider for the FsUsersProvider
final fsUsersProvider = StateNotifierProvider<FsUsersProvider, FsUsersState>((ref) {
  return FsUsersProvider();
});
