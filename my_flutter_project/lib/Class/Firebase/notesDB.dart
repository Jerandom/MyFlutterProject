class NotesDB{
    final String task;
    final bool isDone;
    final Timestamp createdOn;
    final Timestamp updatedOn;

    const NotesDB({
        required this.task,
        required this.isDone,
        required this.createdOn,
        required this.updatedOn,
    });

    // //constructor initialization
    // NotesDB.fromJson(Map<String, Object?> json) : this(
    //         task: json['task']! as String,
    //         isDone: json['isDone']! as bool,
    //         createdOn: json['createdOn']! as Timestamp,
    //         updatedOn: json['updatedOn']! as Timestamp,
    //     );

    // Factory method to create an instance of `NotesDB` from Firestore data
    factory NotesDB.fromJson(Map<String, dynamic> json) => NotesDB (
        task: json['task'] as String,
        isDone: json['isDone'] as bool,
        createdOn: json['createdOn'] as Timestamp,
        updatedOn: json['updatedOn'] as Timestamp,
    );

    // Convert the data back to JSON for uploading to Firestore
    Map<String, dynamic> toJson() {
      return {
        'task': task,
        'isDone': isDone,
        'createdOn': createdOn,
        'updatedOn': updatedOn,
      };
    }
}