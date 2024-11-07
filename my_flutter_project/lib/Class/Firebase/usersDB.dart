class UsersDB{
    final String name;
    final int age;
    final List<dynamic> hobbies;

    const UsersDB({
        required this.name,
        required this.age,
        required this.hobbies,
    });

    // Factory method to create an instance of `FirebaseState` from Firestore data
    factory FirebaseState.fromJson(Map<String, dynamic> json) => FirebaseState (
        name: json['name'] as String,
        age: json['age'] as int,
        hobbies: List<dynamic>.from(json['hobbies']),
    );

    // Convert the data back to JSON for uploading to Firestore
    Map<String, dynamic> toJson() {
      return {
        'name': name,
        'age': age,
        'hobbies': hobbies,
      };
    }
}