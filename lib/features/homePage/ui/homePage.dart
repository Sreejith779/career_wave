import 'package:flutter/material.dart';
import 'package:job_portel/features/homePage/ui/widgets/post_job.dart';
import 'package:job_portel/features/homePage/ui/widgets/tabs.dart';
import 'package:job_portel/features/utils/texts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
                height: 60,
                child: TabBar(
                  tabs: [
                    Tab(
                        child: Text(
                      "Available Jobs",
                      style: Texts().Stext,
                    )),
                    Tab(
                        child: Text(
                      "Post a Job",
                      style: Texts().Stext,
                    )),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    Center(child: Text("Available Jobs content")),
                    PostTabs()
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget searchBox() {
    return Container(
      margin: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.08,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "Search here",
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
