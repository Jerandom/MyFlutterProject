import '../Firebase/usersDB.dart';

class FsUsersState {
  final List<UsersDB> users;

  FsUsersState({
    required this.users
  });

  // A convenient method to create initial state
  factory FsUsersState.initial() => FsUsersState(
    users: []
  );

  FsUsersState copyWith({
    List<UsersDB>? setUsers,
  }) => FsUsersState(
    users: setUsers ?? users
  );
}