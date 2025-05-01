import 'dart:convert';

import 'package:cricbuzz/recent/MatchData.dart';
import 'package:cricbuzz/recent/recentmatchesjson.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class recentmatches extends StatefulWidget {
  const recentmatches({super.key});

  @override
  State<recentmatches> createState() => _recentmatchesState();
}

class _recentmatchesState extends State<recentmatches> {
  Recentmatches? r ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callapi();
  }
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
      body: r!=null?Column(
        children: [
          Center(child: Text("Recent Matches", style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w600))),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: r!.typeMatches!.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                  color:Colors.yellow.shade600,
                child: SizedBox(
                  height: (MediaQuery.of(context).size.height)*0.15,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Matchdata(r!.typeMatches![index]);
                      },));
                    },
                    title: Row(
                      children: [
                        Center(child: Text("${r!.typeMatches![index].matchType}",style: TextStyle(
                          fontSize: 30,fontWeight: FontWeight.w600
                        ),)),
                        Spacer(),Icon(Icons.navigate_next,size: 45,)
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ):Center(child: Lottie.asset("animation/loading.json"),)
    );
  }
  Future<void> callapi() async {
    var url=Uri.parse("https://cricbuzz-cricket.p.rapidapi.com/matches/v1/recent");
    var response =await http.get(url,headers: {
      'x-rapidapi-key': 'c5faf57887msh5112a96591fe94cp1f5c60jsn76204e778451',
      'x-rapidapi-host': 'cricbuzz-cricket.p.rapidapi.com'
    });
    var map=jsonDecode(response.body);
    r = Recentmatches.fromJson(map);
    setState(() {  });
  }
}
