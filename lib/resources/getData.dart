import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_portel/model/dataModel.dart';

Future<List<DbModel>> fetchData() async {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  final List<DbModel> data = [];

  try {
    QuerySnapshot querySnapshot = await _fireStore.collection("jobPost").get();
    data.addAll(querySnapshot.docs
        .map((e) =>  DbModel(
            title: e['Job Role'],
            description: e['Description'],
            company: e['Company Name'],
            location: e['Location'],
            salary: e['Salary'],
            workType: e['Work-type'],
            imageUrl: e['Logo'],
        skills: e['Skills']))
        .toList());

  } catch (e) {}

return data;

}
