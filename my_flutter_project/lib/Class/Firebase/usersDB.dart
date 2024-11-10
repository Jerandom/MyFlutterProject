class UsersDB{
    final String name;
    final int age;
    final List<dynamic> hobbies;

    const UsersDB({
        required this.name,
        required this.age,
        required this.hobbies,
    });

    // Factory method to create an instance of `UsersDB` from Firestore data
    factory UsersDB.fromJson(Map<String, dynamic> json) => UsersDB (
        name: json['name'] as String,
        age: json['age'] as int,
        hobbies: List<dynamic>.from(json['hobbies'] as List<dynamic>),
    );

    // Convert the data back to JSON for uploading to Firestore
    Map<String, dynamic> toJson() {
      return {
        'name': name,
        'age': age,
        'hobbies': hobbies,
      };
    }

    // Override toString for easy printing
    @override
    String toString() {
      return 'UsersDB(name: $name, age: $age, hobbies: $hobbies)';
    }
}