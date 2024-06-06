import 'package:flutter/material.dart';
import 'package:job_portel/features/homePage/ui/homePage.dart';
import 'package:job_portel/features/reviewPage/ui/reviewPage.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  List tabs = [
    ReviewPage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
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
