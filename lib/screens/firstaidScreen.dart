import 'package:flutter/material.dart';

class FirstAidScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("If somenone get a sname bite",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Text(">Remain clam and call for help immediately.\n"
              ">Gently wash the area with soap and water if possible.\n"
          ">Remove tight clothing or jewellery because the area around the bite is likely to swell.\n"
              ">Do not attempt to catch the snake.",textAlign: TextAlign.justify,style: TextStyle(fontSize: 15,color: Colors.grey[600]),),
          SizedBox(height: 30,),
          Text("Medication",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),),
          SizedBox(height: 20,),
          Text(">Always seek medical help. Doctors will determine the right course of treatment and give Anti-Venom if necessary.",textAlign: TextAlign.justify,style: TextStyle(fontSize: 15,color: Colors.grey[600]),),
        ],
      ),
    );
  }
}
