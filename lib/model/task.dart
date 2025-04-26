import 'package:flutter/foundation.dart';

class Task {
  String id;
  String task;
  DateTime time;

  Task({
    required this.id,
    required this.task,
    required this.time,
  });

  factory Task.fromString(String taskText) {
    return Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(), // ID generate
      task: taskText,
      time: DateTime.now(),
    );
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      task: map['task'],
      time: DateTime.fromMillisecondsSinceEpoch(map['time']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'task': task,
      'time': time.millisecondsSinceEpoch,
    };
  }
}