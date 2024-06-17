import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:job_portel/features/utils/texts.dart';

import '../../../model/dataModel.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({
    super.key,
    required this.data,
  });
  final DbModel data;

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Job details",
          style: Texts().Htext,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.data.title,
                        style: Texts().Htext.copyWith(fontSize: 25),
                      ),
                      Image.network(
                        widget.data.imageUrl,
                        width: 70,
                        height: 40,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        widget.data.company,
                        style: Texts().Stext,
                      ),
                      const SizedBox(width: 10,),
                      const Icon(Icons.location_on_outlined,color: Colors.grey,),
                      Text(widget.data.location,style: Texts().Stext,)
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(

                    children: [
                      const Icon(Icons.home,color: Colors.grey,),
                      const SizedBox(width: 5,),
                      Text(widget.data.workType,style: Texts().Stext,),
                      const SizedBox(width: 10,),
                      const Icon(Icons.money,color: Colors.grey,),
                      const SizedBox(width: 5,),
                      Text(widget.data.salary)

                    ],
                  ),
                  const SizedBox(height: 20,),
                  Text("Skills required",style: Texts().Stext,),
                  const SizedBox(height: 10,),
                  Text(widget.data.skills,style: Texts().Stext.copyWith(fontWeight: FontWeight.w600),),
                  const SizedBox(height: 20,),
                  Text("Description",style: Texts().Htext,),
                  Text(widget.data.description,style: Texts().Stext,)
                ],
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width*0.8,
                height: MediaQuery.of(context).size.height*0.08,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.green.withOpacity(0.9),
            ),
                child: Center(child: Text("Apply",
                style: Texts().Htext.copyWith(fontSize: 22,
                color: Colors.white),)),

              ),
            )

            
            
          ],
        ),
      ),
    );
  }
}
