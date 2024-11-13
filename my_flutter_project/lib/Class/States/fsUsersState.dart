import '../Firebase/usersDB.dart';

class FsUsersState {
  final Map<String, UsersDB> users;

  FsUsersState({
    required this.users
  });

  // A convenient method to create initial state
  factory FsUsersState.initial() => FsUsersState(
    users: {},
  );

  // Method to create a copy of the state with some fields replaced
  FsUsersState copyWith({
    Map<String, UsersDB>? setUsers,
  }) => FsUsersState(
    users: setUsers ?? users
  );
}