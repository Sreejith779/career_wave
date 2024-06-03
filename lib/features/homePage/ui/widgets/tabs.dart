import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:job_portel/features/homePage/%20bloc/home_bloc.dart';
import 'package:job_portel/features/reviewPage/ui/reviewPage.dart';
import 'package:job_portel/features/utils/pick_image.dart';
import 'package:job_portel/resources/add_data.dart';
import '../../../utils/texts.dart';

class PostTabs extends StatefulWidget {
  const PostTabs({super.key});

  @override
  State<PostTabs> createState() => _PostTabsState();
}

class _PostTabsState extends State<PostTabs> {
  HomeBloc homeBloc = HomeBloc();
  final PageController pageController = PageController();
  final TextEditingController jobRole = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController location = TextEditingController();

  final TextEditingController skills = TextEditingController();
  final TextEditingController salary = TextEditingController();
  final TextEditingController description = TextEditingController();

  Uint8List? image;
  late var workplaceType;

  final Map<String, String> jobData = {};

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [JobRole(), companyDetails(), JobDescription()],
    );
  }

  Widget JobRole() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(

        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Text(
              "Enter the Job Role",
              style: Texts().Htext,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: TextField(
              controller: jobRole,
              decoration: InputDecoration(
                  hintText: "Enter the title",
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(color: Colors.red, width: 40))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Example",
              style: Texts().Htext,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Use clear, specific terms that describe the primary function of the job. Avoid vague or overly broad titles.",
                  style: Texts().Stext,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Good",
                      style: Texts().Stext.copyWith(
                          color: Colors.green, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      " : Software Engineer",
                      style: Texts().Stext,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Poor",
                      style: Texts().Stext.copyWith(
                          color: Colors.red, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      " : Engineer",
                      style: Texts().Stext,
                    )
                  ],
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.deepPurple.withOpacity(0.9))),
                        onPressed: () {
                          jobData['JobRole'] = jobRole.text;
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.ease);
                        },
                        child: Text(
                          "Next",
                          style: Texts().Stext.copyWith(color: Colors.white),
                        )))
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget companyDetails() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                image != null
                    ? CircleAvatar(
                        backgroundImage: MemoryImage(image!),
                        radius: 50,
                      )
                    : const CircleAvatar(
                        radius: 50,
                      ),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: InkWell(
                    onTap: selectImage,
                    child: Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Text(
                          "Add image",
                          style: Texts().Stext.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Textname("Company"),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: name,
              decoration: InputDecoration(
                  hintText: "name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            const SizedBox(
              height: 10,
            ),
            Textname("Job location"),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: location,
              decoration: InputDecoration(
                  hintText: "location",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            const SizedBox(
              height: 10,
            ),
            Textname("Workplace type"),
            const SizedBox(
              height: 10,
            ),
            DropdownButtonFormField(
                decoration: InputDecoration(
                    hintText: "On-site",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
                items: items.map((e) {
                  return DropdownMenuItem<String>(value: e, child: Text(e));
                }).toList(),
                onChanged: (value) {
                  workplaceType = value ?? " ";
                }),
            const SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.deepPurple.withOpacity(0.9))),
                    onPressed: () {
                      jobData['companyName'] = name.text;
                      jobData['jobLocation'] = location.text;

                      pageController.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.ease);
                    },
                    child: Text(
                      "Next",
                      style: Texts().Stext.copyWith(color: Colors.white),
                    )))
          ],
        ),
      ),
    );
  }

  Widget JobDescription() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Textname("Skills Required"),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: skills,
              decoration: InputDecoration(
                  hintText: "Skills",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            const SizedBox(
              height: 10,
            ),
            Textname("Salary"),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: salary,
              decoration: InputDecoration(
                  hintText: "20000/month",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            const SizedBox(
              height: 10,
            ),
            Textname("Job Description"),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: description,
              minLines: 1,
              maxLines: 5,
              decoration: InputDecoration(
                  hintText: "add description ",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.green.withOpacity(0.8))),
                    onPressed: () {
                      jobData['skills'] = skills.text;
                      jobData['salary'] = salary.text;
                      jobData['description'] = description.text;

                      homeBloc.add(HomePostJobEvent(
                        role: jobRole.text,
                        cName: name.text,
                        cLocation: location.text,
                        cWorkType: workplaceType,
                        skill: skills.text,
                        cSalary: salary.text, cDescription: description.text, image: image!,
                      ));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ReviewPage()));

                      print(jobData);
                    },
                    child: Text(
                      "Review Job",
                      style: Texts().Stext.copyWith(color: Colors.white),
                    )))
          ],
        ),
      ),
    );
  }

  Widget Textname(String name) {
    return Text(
      name,
      style: Texts().Stext,
    );
  }

  final List items = ["On-site", "Remote", "Hybrid"];

  selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      image = img;
    });
  }
}
