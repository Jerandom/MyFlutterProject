class FirebaseState{
    final bool isConnected

    const FirebaseState({
        required this.isConnected,
    });

    // A convenient method to create initial state
    factory ImageIndexState.initial() => ImageIndexState(
        isConnected: false,
    );
    
    // Method to create a copy of the state with some fields replaced
    ImageIndexState copyWith({
        bool? setIsConnected,
    }) => ImageIndexState(
        isConnected: setIsConnected ?? isConnected,
    );
}