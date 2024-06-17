import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:job_portel/features/profilePage/ui/profilePage.dart';


import '../homePages/ui/homePage.dart';
import '../postPage/ui/postPage.dart';
import '../searchPage/ui/searchPage.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  List tabs = [
    ReviewPage(),
    SearchPage(),
    HomePage(),
  ProfilePage()
  ];
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Color(0xFFFFFFFF),
        selectedIndex: tabIndex,
        onDestinationSelected: (value) {
          setState(() {
            tabIndex = value;
          });
        },
        destinations:   [
          NavigationDestination(icon: Image.asset("assets/home.png",
          width: 25,height: 22,), label: 'Home'),
          NavigationDestination(icon: Image.asset("assets/search.png",
          width: 25,height: 22,), label: 'Search'),
          NavigationDestination(icon: Image.asset("assets/job.png",
          width: 25,height: 22,), label: 'Job'),
          NavigationDestination(icon:  Image.asset("assets/person.png",
          width: 25,
          height: 22,), label: 'Person'),
        ],
      ),
      body: tabs[tabIndex],
    );
  }
}
