import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/model/task_model.dart';

CollectionReference<TaskModel> getTaskCollectionReference() {
  return FirebaseFirestore.instance.collection('task').withConverter<TaskModel>(
        fromFirestore: (snapshot, options) =>
            TaskModel.fromJson(snapshot.data()!),
        toFirestore: (value, options) => value.toJson(),
      );
}

Future<void> addTaskToFirebase(TaskModel model) {
  var collection = getTaskCollectionReference();
  var docRef = collection.doc();
  model.id = docRef.id;
  return docRef.set(model);
}

Stream<QuerySnapshot<TaskModel>> getDataFromFirebase(DateTime dateTime) {
  return getTaskCollectionReference()
      .where('date',
          isEqualTo: DateUtils.dateOnly(dateTime).microsecondsSinceEpoch)
      .snapshots();
}

Future<void> deleteTaskFromFirebase(TaskModel model) async {
  return await getTaskCollectionReference().doc(model.id).delete();
}

Future<void> updateDoneTaskFromFirebase(TaskModel model) {
  return getTaskCollectionReference().doc(model.id).update({'isDone': true});
}

Future<void> updateTaskFromFirebase({required Map<String, dynamic> toJson}) {
  final docRef = getTaskCollectionReference().doc(toJson['id']);
  return docRef.update(toJson);
}
