class FirebaseState{
    final bool isConnected;

    const FirebaseState({
        required this.isConnected,
    });

    // A convenient method to create initial state
    factory FirebaseState.initial() => FirebaseState(
        isConnected: false,
    );
    
    // Method to create a copy of the state with some fields replaced
    FirebaseState copyWith({
        bool? setIsConnected,
    }) => FirebaseState(
        isConnected: setIsConnected ?? isConnected,
    );
}