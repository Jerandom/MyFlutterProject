import '../Firebase/mixedData.dart';

class FsMixedDataState {
  final Map<String, MixedData> mixedData;

  FsMixedDataState({
    required this.mixedData
  });

  // A convenient method to create initial state
  factory FsMixedDataState.initial() => FsMixedDataState(
    mixedData: {},
  );

  // Method to create a copy of the state with some fields replaced
  FsMixedDataState copyWith({
    Map<String, MixedData>? setMixedData,
  }) => FsMixedDataState(
    mixedData: setMixedData ?? mixedData
  );
}