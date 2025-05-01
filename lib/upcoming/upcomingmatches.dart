import 'dart:convert';

import 'package:cricbuzz/upcoming/MatchData.dart';
import 'package:cricbuzz/upcoming/upcomingmatchesjson.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class Upcomingmatches extends StatefulWidget {
  const Upcomingmatches({super.key});

  @override
  State<Upcomingmatches> createState() => _UpcomingmatchesState();
}

class _UpcomingmatchesState extends State<Upcomingmatches> {
  Upcomingmatchesjson? up;

  @override
  void initState() {
    super.initState();
    upcomingmatchesapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade800,
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
          up != null
              ? Column(
                children: [
                  Center(
                    child: Text(
                      "Upcoming Matches",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: up!.typeMatches.length,
                      itemBuilder: (context, typematchesindex) {
                        return Card(
                          elevation: 50,
                          color: Colors.yellow.shade600,
                          child: SizedBox(
                            height: (MediaQuery.of(context).size.height) * 0.15,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return MatchData(
                                        up!.typeMatches[typematchesindex],
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(width: 25),
                                  Text(
                                    "${up!.typeMatches[typematchesindex].matchType}",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(Icons.navigate_next_rounded, size: 45),
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
              : Center(child: Lottie.asset("animation/loading.json")),
    );
  }

  void upcomingmatchesapi() async {
    var url = Uri.parse(
      "https://cricbuzz-cricket.p.rapidapi.com/matches/v1/upcoming",
    );
    var response = await http.get(
      url,
      headers: {
        'x-rapidapi-key': 'c5faf57887msh5112a96591fe94cp1f5c60jsn76204e778451',
        'x-rapidapi-host': 'cricbuzz-cricket.p.rapidapi.com',
      },
    );
    var map = jsonDecode(response.body);
    print(response.body);
    up = Upcomingmatchesjson.fromJson(map);
    setState(() {});
  }
}
