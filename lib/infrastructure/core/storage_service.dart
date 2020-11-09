import 'dart:io';

import 'package:flutter/material.dart';
import 'package:study_buddy/domain/core/storage_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService implements StorageRepository {
  final _storageInstance = FirebaseStorage.instance;

  Future<String> uploadImage({@required File image}) async {
    String path = image.path;
    final start = path.lastIndexOf('/') + 1;
    final end = path.lastIndexOf('g') + 1;
    final fileName = path.substring(start, end);

    Reference firebaseStorageRef = _storageInstance.ref().child(fileName);
    final taskSnapshot = await firebaseStorageRef.putFile(image);

    return await taskSnapshot.ref.getDownloadURL();
  }
}
