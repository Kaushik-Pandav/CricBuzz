import 'package:cricbuzz/live/livematchesjson.dart';
import 'package:flutter/material.dart';

import 'livematchesdetails.dart';

class Matchdatas extends StatefulWidget {
  Matchdatas({required this.typeMatches});
  TypeMatches typeMatches;

  @override
  State<Matchdatas> createState() => _MatchdatasState();
}

class _MatchdatasState extends State<Matchdatas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.deepPurple.shade600,
      appBar: AppBar(
        title: Text(
          "Cricbuzz",
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
        leading: Image.asset("Assets/image-removebg-preview.png"),
        elevation: 3,
        backgroundColor: Color.fromRGBO(73, 7, 143,1),
      ),
      body: ListView.builder(
        itemCount: widget.typeMatches.seriesMatches!.length,
        itemBuilder: (context, index) {
          if(widget.typeMatches.seriesMatches![index].seriesAdWrapper!=null){
            return Card(
              elevation: 5,color: Colors.yellow.shade600,
              child: SizedBox(
                height:( MediaQuery.of(context).size.height)*0.15,
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return livematchesdetails(widget.typeMatches.seriesMatches![index]);
                    },),  );
                  },
                  title: Center(child: Text("${widget.typeMatches.seriesMatches![index].seriesAdWrapper!.seriesName}",style: TextStyle(
                    fontWeight: FontWeight.w600,fontSize: 20
                  ),)),
                ),
              ),
            );
          }
          else{
            return ListTile(
              title: Text("${widget.typeMatches.seriesMatches![index].adDetail}",style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.w600
              ),),
            );
          }
        },
      ),
    );
  }
}
