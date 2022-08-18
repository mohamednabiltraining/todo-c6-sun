import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_c6_sun/dialoges_utils.dart';
import 'package:todo_c6_sun/my_database/task.dart';

class MyDataBase{

  static CollectionReference<Task> getTasksCollection(){
    return FirebaseFirestore.instance.collection(Task.collectionName)
        .withConverter<Task>(fromFirestore:(docSnapshot,_){
      return Task.fromFirestore(docSnapshot.data()!);
    }, toFirestore: (task,_){
      return task.toFirestore();
    });
  }

  static Future<void> addTask(Task task){
    var tasksCollection = getTasksCollection();
    var doc = tasksCollection.doc();
    task.id = doc.id;
    return doc.set(task);
  }
  static Future<QuerySnapshot<Task>> getTasks(DateTime dateTime){
    return getTasksCollection()
    .where('dateTime',isEqualTo: dateOnly(dateTime).millisecondsSinceEpoch)
        .get();
  }
  static Stream<QuerySnapshot<Task>> listenForTasksUpates(
      DateTime dateTime
      ){
    return getTasksCollection()
        .where('dateTime',isEqualTo: dateOnly(dateTime).millisecondsSinceEpoch)
        .snapshots();
  }
  static Future<void> deleteTask(Task task){
    var taskDock = getTasksCollection()
        .doc(task.id);
    return taskDock.delete();
  }

}