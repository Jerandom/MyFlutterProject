class MixedData{
    final List<dynamic> arrType;
    final bool boolType;
    final int intType;
    final String stringType;

    const MixedData({
        required this.arrType,
        required this.boolType,
        required this.intType,
        required this.stringType,
    });

    // Factory method to create an instance of `MixedData` from Fire store data
    factory MixedData.fromJson(Map<String, dynamic> json) => MixedData (
        arrType: List<dynamic>.from(json['arrType'] as List<dynamic>),
        boolType: json['boolType'] as bool,
        intType: json['intType'] as int,
        stringType: json['stringType'] as String,
    );

    // Convert the data back to JSON for uploading to Fire store
    Map<String, dynamic> toJson() {
      return {
        'arrType': arrType,
        'boolType': boolType,
        'intType': intType,
        'stringType': stringType,
      };
    }

    // Override toString for easy printing
    @override
    String toString() {
      return 'MixedData(arrType: $arrType, boolType: $boolType, intType: $intType, stringType: $stringType)';
    }
}