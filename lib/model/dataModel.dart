import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DbModel {
  final String title;
  final String description;
  final String company;
  final String location;
  final String salary;
  final String workType;
  final String imageUrl;
  final String skills;


  DbModel(
      {required this.title,
      required this.description,
      required this.company,
      required this.location,
      required this.salary,
      required this.workType,
      required this.imageUrl,
      required this.skills});
}
