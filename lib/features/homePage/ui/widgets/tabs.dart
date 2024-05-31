import 'package:flutter/material.dart';
import 'package:job_portel/features/homePage/ui/widgets/job_salary.dart';
import 'package:job_portel/features/homePage/ui/widgets/post_job.dart';

import '../../../utils/texts.dart';

class PostTabs extends StatefulWidget {
  const PostTabs({super.key});

  @override
  State<PostTabs> createState() => _PostTabsState();
}

class _PostTabsState extends State<PostTabs> {
  List tabs = [
    PostJob(),
    JobSalary(),
    JobSalary(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              decoration: InputDecoration(
                  hintText: "Enter the title",
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.red, width: 40))),
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
            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
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
                      ": Software Engineer",
                      style: Texts().Stext,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Poor",
                      style: Texts()
                          .Stext
                          .copyWith(color: Colors.red, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      ": Engineer",
                      style: Texts().Stext,
                    )
                  ],
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple.withOpacity(0.9))
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>
                              JobSalary()));
                        }, child:   Text("Next",
                      style: Texts().Stext.copyWith(color: Colors.white),)))
              ],
            ),
          ),
        ]));
  }
}
