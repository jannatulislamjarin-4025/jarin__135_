import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/task.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  
  Future<void> addTask(Task task) async {
    await _db.collection('tasks').doc(task.id).set(task.toMap());
  }

  
  Future<void> deleteTask(String id) async {
    await _db.collection('tasks').doc(id).delete();
  }

  
  Stream<List<Task>> getTasks() {
    return _db.collection('tasks').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Task.fromMap(doc.data())).toList();
    });
  }
}