import 'package:cloud_firestore/cloud_firestore.dart';

class NotesDB{
  final String task;
  final bool isDone;
  final DateTime createdOn;
  final DateTime updatedOn;

  const NotesDB({
    required this.task,
    required this.isDone,
    required this.createdOn,
    required this.updatedOn,
  });

  // Factory method to create an instance of `NotesDB` from Firestore data
  factory NotesDB.fromJson(Map<String, dynamic> json) => NotesDB (
    task: json['task'] as String,
    isDone: json['isDone'] as bool,
    createdOn: (json['createdOn'] as Timestamp).toDate(),
    updatedOn: (json['updatedOn'] as Timestamp).toDate(),
  );

  // Convert the data back to JSON for uploading to Firestore
  Map<String, dynamic> toJson() {
    return {
      'task': task,
      'isDone': isDone,
      'createdOn': Timestamp.fromDate(createdOn),
      'updatedOn': Timestamp.fromDate(updatedOn),
    };
  }

  // Override toString for easy printing
  @override
  String toString() {
    return 'NotesDB(task: $task, isDone: $isDone, createdOn: $createdOn, updatedOn: $updatedOn)';
  }
}