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
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.badge_rounded), label: 'Job'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Person'),
        ],
      ),
      body: tabs[tabIndex],
    );
  }
}
