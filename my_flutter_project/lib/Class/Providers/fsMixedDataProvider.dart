import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Firebase/MixedDataDB.dart';
import '../States/FsMixedDataState.dart';

const String USER_COLLECTION_REF = "mixedData";

class FsMixedDataProvider extends StateNotifier<FsMixedDataState> {
  //create an instance of fire store
  final _fireStore = FirebaseFirestore.instance;
  late final CollectionReference _mixedDataRef;

  FsMixedDataProvider() : super(FsMixedDataState.initial()) {
    // constructor
    _initUserRef();
    _listenToRefChange();
  }

  // initialize ref to follow a structure
  void _initUserRef() {
    _mixedDataRef = _fireStore.collection(USER_COLLECTION_REF);
  }

  // listener to watch Fire store changes
  void _listenToRefChange() {
    _mixedDataRef.snapshots().listen((QuerySnapshot<Object?> snapshot) {
      final Map<String, MixedDataDB> newMixedData = {
        for (var doc in snapshot.docs)
          doc.id: MixedData.fromJson(doc.data() as Map<String, dynamic>)
      };

      // Update the state with the new map of users
      state = state.copyWith(setMixedData: newMixedData);

      print(newMixedData);
    });
  }

  // Method to add data to Fire store
  Future<void> addData(FsMixedDataState mixedDataState) async {
    await _mixedDataRef.add(mixedDataState);
  }
}

// Define a provider for the FsMixedDataProvider
final fsMixedDataProvider = StateNotifierProvider<FsMixedDataProvider, FsMixedDataState>((ref) {
  return FsMixedDataProvider();
});
