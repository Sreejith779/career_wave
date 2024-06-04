import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:job_portel/resources/add_data.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("ReviewPage"),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: StoreData().getData(),
          builder: (context,snapshot){
            if(snapshot.hasError){
              Text("Error : ${snapshot.error}");
            }
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final data = snapshot.data!.docs;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context,index){
                  return ListTile(
                    title: Text(data[index]['Company Name']),
                  );
                });
          }),
    );
  }

}
