import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:job_portel/features/homePage/ui/widgets/urgetTile.dart';
import 'package:job_portel/features/utils/texts.dart';
import 'package:job_portel/resources/add_data.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: CircleAvatar(
            minRadius: 2,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Robin K Philiph",
              style: Texts()
                  .Htext
                  .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              "Bangalore,Karnataka",
              style: Texts().Stext.copyWith(fontSize: 15),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                CircleAvatar(backgroundColor: Colors.grey.withOpacity(0.2)),
                const SizedBox(
                  width: 5,
                ),
                CircleAvatar(backgroundColor: Colors.grey.withOpacity(0.2)),
              ],
            ),
          )
        ],
      ),

      body: StreamBuilder<QuerySnapshot>(
          stream: StoreData().getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              Text("Error : ${snapshot.error}");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final data = snapshot.data!.docs;
            return SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text("Urgently Need",
                      style: Texts().Htext.copyWith(
                        fontSize: 18
                      ),),
                    ),
                    UrgentTile(data: data,),
              Text("Recommendationss",style: Texts().Htext,),
                    Expanded(
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Container(margin: EdgeInsets.all(5),
                              height: MediaQuery.of(context).size.height*0.18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey.withOpacity(0.2),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20,top: 20),
                                    child: Container(
                                      height: 45,
                                      width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black,
                                      image: DecorationImage(image: NetworkImage(data[index]['Logo']),
                                      fit: BoxFit.cover)
                                    ),

                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,top: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(data[index]['Company Name'],style: Texts().Stext.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15
                                        ),),
                                        Text(data[index]['Job Role'],
                                        style: Texts().Htext.copyWith(
                                          fontSize: 17
                                        ),)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10,left: 20),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: Colors.white.withOpacity(0.7),
                                          ),
                                          child: Center(child: Text(data[index]['Salary'])),
                                        ),
                                        const SizedBox(width: 10,),
                                        Container(
                                          height: 30,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: Colors.white.withOpacity(0.7),
                                          ),
                                          child: Center(child: Text(data[index]['Work-type'])),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(data[index]['Location'],style: Texts().Stext.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500
                                    ),),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
