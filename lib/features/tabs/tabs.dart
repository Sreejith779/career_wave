

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
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
  List tabs = [ReviewPage(), SearchPage(), HomePage(), ProfilePage()];
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true, body: tabs[tabIndex],
        bottomNavigationBar: DotNavigationBar(
            itemPadding: EdgeInsets.all(16),
            marginR: EdgeInsets.symmetric(horizontal: 60, vertical: 0),
            paddingR: EdgeInsets.symmetric(horizontal: 6, vertical: 0),
          splashColor: Colors.green.withOpacity(0.5),
          splashBorderRadius: 20,
          backgroundColor: Colors.white,


                 enableFloatingNavBar:  true,
            curve: Curves.easeIn,



            currentIndex: tabIndex,
            onTap: (value){
              setState(() {
                tabIndex = value;
              });
            },



            items: [
              DotNavigationBarItem(icon: Image.asset("assets/home.png",height: 20,width: 20,), ),
              DotNavigationBarItem(icon: Image.asset("assets/search.png",height: 20,width: 20,), ),
              DotNavigationBarItem(icon: Image.asset("assets/job.png",height: 20,width: 20,), ),
              DotNavigationBarItem(icon: Image.asset("assets/person.png",height: 20,width: 20,),),
        ])
    );
  }
}
