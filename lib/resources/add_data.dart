import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StoreData {
  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    try {
      // Generate a unique identifier for each image
      String uniqueId = const Uuid().v4();
      Reference ref = _storage.ref().child('$childName/$uniqueId');
      UploadTask uploadTask = ref.putData(file);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print(e);
      throw Exception('Failed to upload image to storage');
    }
  }

  Future<String> saveData({
    required String jobRole,
    required String cName,
    required String location,
    required String type,
    required String skills,
    required String salary,
    required String description,
    required Uint8List file,
  }) async {
    String response = "Some error occurred";
    try {
      // Upload the image and get the URL
      String imageUrl = await uploadImageToStorage("companyImage", file);

      // Save the job post data to Firestore
      await _firestore.collection("jobPost").add({
        "Job Role": jobRole,
        "Company Name": cName,
        "Location": location,
        "Work-type": type,
        "Skills": skills,
        "Salary": salary,
        "Description": description,
        "Logo": imageUrl,
        "timestamp": FieldValue.serverTimestamp(),
      });

      response = "success";
    } catch (e) {
      print(e);
      response = "Failed to save data: $e";
    }
    return response;
  }
}
