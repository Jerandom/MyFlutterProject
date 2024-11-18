import 'package:firebase_auth/firebase_auth.dart';

class FsUserAccountState {
  final User? user;
  final String lastErrorMsg;

  const FsUserAccountState({
    required this.user,
    required this.lastErrorMsg,
  });

  // A convenient method to create initial state
  factory FsUserAccountState.initial() => FsUserAccountState(
    user: null,
    lastErrorMsg: "",
  );

  // Method to create a copy of the state with some fields replaced
  FsUserAccountState copyWith({
    User? setUser,
    String? setLastErrorMsg,
  }) => FsUserAccountState(
    user: setUser ?? user,
    lastErrorMsg: setLastErrorMsg ?? lastErrorMsg,
  );
}
