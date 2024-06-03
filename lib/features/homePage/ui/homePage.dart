import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism/glassmorphism.dart';

import 'package:job_portel/features/homePage/ui/widgets/tabs.dart';
import 'package:job_portel/features/utils/texts.dart';

import '../ bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
     homeBloc.add(HomeInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case HomeLoadedState:
            return DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text(
                      "Let's Connect You",
                      style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    backgroundColor: Colors.deepPurple.withOpacity(0.8),
                  ),
                  body: Column(
                    children: [
                      Container(
                        color: Colors.deepPurple.withOpacity(0.8),
                        child: searchBox(),
                      ),
                      Divider(
                        color: Colors.grey.withOpacity(0.3),
                        thickness: 20,
                      ),
                      Container(
                        color: Colors.grey.withOpacity(0.1),
                        height: 60,
                        child: TabBar(

                          tabs: [
                            Tab(
                                child: Text(
                                  "Available Jobs",
                                  style: Texts().Stext.copyWith(
                                    fontWeight: FontWeight.w500
                                  ),
                                )),
                            Tab(
                                child: Text(
                                  "Post a Job",
                                  style: Texts().Stext.copyWith(
                                      fontWeight: FontWeight.w500
                                  ),
                                )),
                          ],
                        ),
                      ),
                        Expanded(
                        child: TabBarView(
                          children: [
                            Center(child: Text("Available Jobs content")),

                            Container(
                                color: Colors.blueAccent.withOpacity(0.1),
                                height: 600,
                                child: PostTabs())
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
          default:
            return SizedBox();
        }

      },
    );
  }

  Widget searchBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GlassmorphicContainer(
        width: MediaQuery.of(context).size.width*1,
        height: MediaQuery.of(context).size.height*0.085,
        borderRadius: 25,
        blur: 50,
        alignment: Alignment.bottomCenter,
        border: 3,
        linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFffffff).withOpacity(0.5),
              Color(0xFFFFFFFF).withOpacity(0.01),
            ],
            stops: [
              0.5,
              1,
            ]),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFffffff).withOpacity(0.5),
            Color((0xFFFFFFFF)).withOpacity(0.5),
          ],
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: "Search here",
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}





