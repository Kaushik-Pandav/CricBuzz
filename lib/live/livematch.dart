import 'dart:convert';
import 'package:cricbuzz/live/livematchesjson.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Matchdata.dart';

class Livematch extends StatefulWidget {
  const Livematch({super.key});

  @override
  State<Livematch> createState() => _LivematchState();
}

class _LivematchState extends State<Livematch> {
  Livejson? lm;
@override
  void initState() {
    super.initState();
    calllivematchapi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade600,
      appBar: AppBar(
        title: Text(
          "Cricbuzz",
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
        leading: Image.asset("Assets/image-removebg-preview.png"),
        elevation: 3,
        backgroundColor: Color.fromRGBO(73, 7, 143, 1),
      ),
      body:
          lm != null
              ? Column(
                children: [
                  SizedBox(height: 10),
                  Center(
                    child: Text("Live Matches", style: TextStyle(fontSize: 25)),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: lm!.typeMatches!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 3,
                          color: Colors.yellow.shade600,
                          child: SizedBox(
                            height: (MediaQuery.of(context).size.height) * 0.25,
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => Matchdatas(
                                          typeMatches: lm!.typeMatches![index],
                                        ),
                                  ),
                                );
                              },
                              title: Row(
                                children: [
                                  Center(
                                    child: Text(
                                      "${lm!.typeMatches![index].matchType}",
                                      style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Spacer()
                                  ,Icon(Icons.navigate_next,size:45 ,)
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
              : Center(
                child: CircularProgressIndicator(),
              ),
    );
  }

  Future<void> calllivematchapi() async {
    var url = Uri.parse(
      "https://cricbuzz-cricket.p.rapidapi.com/matches/v1/live",
    );
    var response = await http.get(
      url,
        headers: {
          'x-rapidapi-key': 'c5faf57887msh5112a96591fe94cp1f5c60jsn76204e778451',
          'x-rapidapi-host': 'cricbuzz-cricket.p.rapidapi.com'
        }
    );
    var map = jsonDecode(response.body);
    lm = Livejson.fromJson(map);
    setState(() {});
  }
}
