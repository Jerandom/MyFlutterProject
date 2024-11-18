import '../Firebase/MixedDataDB.dart';

class FsMixedDataState {
  final Map<String, MixedDataDB> mixedData;

  FsMixedDataState({
    required this.mixedData
  });

  // A convenient method to create initial state
  factory FsMixedDataState.initial() => FsMixedDataState(
    mixedData: {},
  );

  // Method to create a copy of the state with some fields replaced
  FsMixedDataState copyWith({
    Map<String, MixedDataDB>? setMixedData,
  }) => FsMixedDataState(
    mixedData: setMixedData ?? mixedData
  );
}