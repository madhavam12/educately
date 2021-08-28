import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:educately/models/notes.dart';
import 'dart:async';
import 'package:educately/models/user.dart';

class Firestore {
  final _firestore = FirebaseFirestore.instance;

  Future<void> uploadNotes({@required Notes notes}) {
    _firestore.collection('notes').doc().set(notes.toJson());
  }

  Future createStudentProfile({@required UserModel student}) {
    _firestore
        .collection('student')
        .doc()
        .set(student.toJson())
        .catchError((e) => e);
  }
}
