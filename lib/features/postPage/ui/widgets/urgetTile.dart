import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../utils/texts.dart';


class UrgentTile extends StatelessWidget {
 final List<QueryDocumentSnapshot>data;
  const UrgentTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return      SizedBox(
      height: MediaQuery.of(context).size.height*0.2,
      width: double.maxFinite,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context,index){
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),

              color: Colors.green.withOpacity(0.1),
            ),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(data[index]['Logo']),
                      ),
                    ),
                    Expanded(child: Text(data[index]['Job Role'],style: Texts().Stext.copyWith(
                        fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.7)
                    ),))
                  ],
                ),
                Text("Rs ${data[index]['Salary']}",style: Texts().Stext.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.6)
                ),),
                const Divider(

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(data[index]['Company Name'],style: Texts().Htext.copyWith(fontSize: 16,
                    color: Colors.black.withOpacity(0.7)),),
                    Container(
                      height: 25,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(child: Text("Apply",style: Texts().Stext.copyWith(fontSize: 15,
                          fontWeight: FontWeight.w500),)),
                    )
                  ],
                )
              ],
            ),
          );
        }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,
          childAspectRatio: 0.8),),
    );
  }
}
