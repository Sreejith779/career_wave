import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:job_portel/features/utils/texts.dart';
import 'package:job_portel/resources/add_data.dart';

import '../../postPage/ui/widgets/urgetTile.dart';
import '../bloc/data_bloc.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  DataBloc dataBloc = DataBloc();
  @override
  void initState() {
    dataBloc.add(DataInitialLoadingState());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataBloc, DataState>(
      bloc: dataBloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case DataLoadingState:
          return Center(
            child: CircularProgressIndicator(),
          );
          case DataLoadedState:
            final loadedState = state as DataLoadedState;
            return Scaffold(
              backgroundColor: const Color(0xFFFFFFFF),
              appBar: AppBar(
                backgroundColor: const Color(0xFFFFFFFF),
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
                      // physics: NeverScrollableScrollPhysics(),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 20),
                              child: Text(
                                "Urgently Need",
                                style: Texts().Htext.copyWith(fontSize: 18),
                              ),
                            ),
                            UrgentTile(
                              data: data,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 5),
                              child: Text(
                                "Recommendationss",
                                style: Texts().Htext,
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.35,
                              width: MediaQuery.of(context).size.width * 1.5,
                              color: Colors.white.withOpacity(0.4),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.deepPurple.withOpacity(0.1),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20, top: 20),
                                                child: Container(
                                                  height: 45,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(10),
                                                      color: Colors.black,
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              data[index]['Logo']),
                                                          fit: BoxFit.cover)),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, top: 10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      data[index]['Company Name'],
                                                      style: Texts().Stext.copyWith(
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          fontSize: 15),
                                                    ),
                                                    Text(
                                                      data[index]['Job Role'],
                                                      style: Texts()
                                                          .Htext
                                                          .copyWith(fontSize: 17),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, left: 20),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(5),
                                                    color: Colors.white
                                                        .withOpacity(0.7),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                          data[index]['Salary'])),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(5),
                                                    color: Colors.white
                                                        .withOpacity(0.7),
                                                  ),
                                                  child: Center(
                                                      child: Text(data[index]
                                                      ['Work-type'])),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(left: 20),
                                            child: Text(
                                              data[index]['Location'],
                                              style: Texts().Stext.copyWith(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 20),
                              child: Text(
                                "Certified Courses",
                                style: Texts().Htext,
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: loadedState.courseData.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    margin: const EdgeInsets.all(10),
                                    height:
                                    MediaQuery.of(context).size.height * 0.4,
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.deepPurple.withOpacity(0.6),
                                      image: DecorationImage(image: NetworkImage(loadedState.courseData[index].image),opacity: 0.5)
                                    ),
                                    child:   Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(15),
                                           color: Colors.white.withOpacity(0.7),
                                         ),
                                            width: MediaQuery.of(context).size.width*0.5,
                                            height: MediaQuery.of(context).size.height*0.03,
                                            child: Center(child: Text(loadedState.courseData[index].subTitle,style:
                                              Texts().Stext.copyWith(
                                                fontWeight: FontWeight.w600
                                              ),)),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(loadedState.courseData[index].title,
                                          style: Texts().Htext.copyWith(color: Colors.white,
                                          fontSize: 22),),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            );

          default:
            return const SizedBox();
        }

      },
    );
  }
}
