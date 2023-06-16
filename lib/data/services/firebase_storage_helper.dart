import 'dart:developer';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageHelper {

  final storage = FirebaseStorage.instance.ref();

  Future<void> getDataFromStorage() async {
    List items = [];
    await storage.child('avaters').listAll().then((value) {
      items = value.items;
    });
    List<String> imageRef = [];
    for (var element in items) {
      imageRef.add(await element.getDownloadURL());
    }
    log(imageRef.toString());
  }
}