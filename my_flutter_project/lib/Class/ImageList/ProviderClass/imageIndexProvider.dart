import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../StateClass/ImageIndexState.dart';

class ImageIndexProvider extends StateNotifier<ImageIndexState> {
    ImageIndexProvider() : super (ImageIndexState.initial()) {
        // constructor
    }

    // method to set the page index
    void setPageIndex(int index){
        state = state.copyWith(
            setPageIndex: index,
        );
    }

    // method to set the page limit
    void setPageLimit(int limit){
        state = state.copyWith(
            setPageLimit: limit,
        );
    }
}

// Define a provider for the ImageIndexProvider
final imageIndexProvider = StateNotifierProvider<ImageIndexProvider, ImageIndexState>((ref) {
    return ImageIndexProvider();
});