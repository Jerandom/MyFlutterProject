import 'package:firebase_auth/firebase_auth.dart';

class FsUserAccountState {
  final User? user;
  final String errorMsg;

  const FsUserAccountState({
    required this.user,
    required this.errorMsg,
  });

  // A convenient method to create initial state
  factory FsUserAccountState.initial() => FsUserAccountState(
    user: null,
    errorMsg: "",
  );

  // Method to create a copy of the state with some fields replaced
  FsUserAccountState copyWith({
    User? setUser,
    String? setErrorMsg,
  }) => FsUserAccountState(
    user: setUser ?? user,
    errorMsg: setErrorMsg ?? errorMsg,
  );
}
