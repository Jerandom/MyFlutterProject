class ImageIndexState{
    final int pageIndex;
    final int pageLimit;
    
    const ImageIndexState({
        required this.pageIndex,
        required this.pageLimit,
    });
    
    // A convenient method to create initial state
    factory ImageIndexState.initial() => ImageIndexState(
        pageIndex: 0,
        pageLimit: 3,
    );
    
    // Method to create a copy of the state with some fields replaced
    ImageIndexState copyWith({
        int? setPageIndex,
        int? setPageLimit,
    }) => ImageIndexState(
        pageIndex: setPageIndex ?? pageIndex,
        pageLimit: setPageLimit ?? pageLimit,
    );
}