import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portel/features/utils/texts.dart';

import '../bloc/search_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchBloc searchBloc = SearchBloc();
  var searchQuery = "";
  @override
  void initState() {
    searchBloc.add(SearchInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: searchBloc,
      builder: (context, state) {
        switch (state.runtimeType) {
          case SearchLoadedState:
            final loadedState = state as SearchLoadedState;
            final filteredList = searchQuery.isEmpty? loadedState.data:
                loadedState.data.where((element) => element.title.toLowerCase().contains(searchQuery.toLowerCase())).toList();
            return Scaffold(
              appBar: AppBar(
                title:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Find a job",style: Texts().Htext.copyWith(fontSize: 24),),
                    Container(
                      margin:
                      const EdgeInsets.only(top: 10, left: 5, right: 5),
                      height: 60,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child:   TextField(
                        onChanged: (value){
                          setState(() {
                            searchQuery = value!;
                            print(searchQuery);
                          });
                        },
                        decoration: InputDecoration(
                            hintText: "Job title or keyword",
                            hintStyle: Texts().Stext,
                            prefixIcon: const Icon(Icons.search),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),
                  ],
                ),
                toolbarHeight: 100,
              ),
              body:

              Container(
                child: Column(
                  children: [

                    Expanded(
                      child: ListView.builder(
                          itemCount:filteredList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                              child: ListTile(
                                shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none
                                ),

                                  tileColor: Colors.grey.withOpacity(0.1),
                                leading: Column(
                                  children: [
                                  Expanded(
                                    child: Container(

                                      decoration: BoxDecoration(
                                               borderRadius: BorderRadius.circular(15)
                                             ),

                                      child: Image.network(loadedState.data[index].imageUrl,
                                      fit: BoxFit.cover,
                                      height: 50,
                                      width: 50,),
                                    ),
                                  )
                                  ],
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(filteredList[index].title,style: Texts().Htext,),
                                    Text(filteredList[index].company,style: Texts().Stext,),
                                    Row(
                                      children:[
                                      Container(
                                        color: Colors.blue.withOpacity(0.1),
                                        child: Text(filteredList[index].salary,style: Texts().Stext,),
                                      ),
                                        const SizedBox(width: 10,),
                                      Container(
                                        color: Colors.blue.withOpacity(0.1),
                                        child: Text(filteredList[index].workType,style: Texts().Stext,),
                                      ),
                                        const SizedBox(width: 10,),
                                        Container(
                                          color: Colors.blue.withOpacity(0.1),
                                          child: Text(filteredList[index].location,style: Texts().Stext,),
                                        ),
                                      ]
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            );

          default:
            return SizedBox();
        }
      },
    );
  }
}
