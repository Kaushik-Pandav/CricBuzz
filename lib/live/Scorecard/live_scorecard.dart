import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'livescorecardjson.dart';
import 'package:http/http.dart' as http;

class livescorecard extends StatefulWidget {
  const livescorecard({super.key, required this.matchid});

  final int matchid;

  @override
  State<livescorecard> createState() => _livescorecardState();
}

class _livescorecardState extends State<livescorecard> {
  Livescorecardjson? ls;

  @override
  void initState() {
    super.initState();
    callapiscorecard(matchid: widget.matchid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          callapiscorecard(matchid: widget.matchid);
        },
      ),
      appBar: AppBar(
        title: Text(
          "Cricbuzz",
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
        leading: Image.asset("Assets/image-removebg-preview.png"),
        elevation: 3,
        backgroundColor: Color.fromRGBO(73, 7, 143, 1),
      ),
      body: ls != null
          ? RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        color: Color.fromRGBO(73, 7, 143, 1),
        backgroundColor:  Colors.yellow.shade600,
        elevation: 20,
        onRefresh: () {
       return callapiscorecard(matchid: widget.matchid);
        },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: (MediaQuery.of(context).size.height) * 0.12,
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade600,
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.yellow.shade600,
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment(-0.9, 1),
                                child: Text(
                                  "${ls!.matchHeader!.status}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  SizedBox(width: 15),
                                  Align(
                                    child: SizedBox(
                                      width: 100,
                                      child: Text(
                                        "${ls!.scoreCard[0].batTeamDetails!.batTeamShortName}",
                                        style: TextStyle(fontSize: 25),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${ls!.scoreCard[0].scoreDetails!.runs}-${ls!.scoreCard[0].scoreDetails!.wickets} (${ls!.scoreCard[0].scoreDetails!.overs})",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        ls!.scoreCard.length > 1
                            ? Row(
                              children: [
                                SizedBox(width: 15),
                                Align(
                                  child: SizedBox(
                                    width: 100,
                                    child: Text(
                                      "${ls!.scoreCard[1].batTeamDetails!.batTeamShortName}",
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  ),
                                ),
                                Text(
                                  "${ls!.scoreCard[1].scoreDetails!.runs}-${ls!.scoreCard[1].scoreDetails!.wickets} (${ls!.scoreCard[1].scoreDetails!.overs})",
                                  style: TextStyle(fontSize: 25),
                                ),
                              ],
                            )
                            : SizedBox(),
                      ],
                    ),
                  ),
                  ls!.scoreCard.isNotEmpty
                      ? batscorecard(
                        lenth:
                            ls!
                                .scoreCard[0]
                                .batTeamDetails!
                                .batsmenData
                                .length,
                        batsman:
                            ls!.scoreCard[0].batTeamDetails!.batsmenData,
                        overs: ls!.scoreCard[0].scoreDetails!.overs,
                        teamnamess:
                            ls!
                                .scoreCard[0]
                                .batTeamDetails!
                                .batTeamShortName!,
                        teamrunsss: ls!.scoreCard[0].scoreDetails!.runs,
                        teamwicketsss:
                            ls!.scoreCard[0].scoreDetails!.wickets,
                        extradata: ls!.scoreCard[0].extrasData!,
                        bowlersData:
                            ls!.scoreCard[0].bowlTeamDetails!.bowlersData!,
                      )
                      : SizedBox(child: Text("Match Yet to Start")),
                  ls!.scoreCard.length > 1
                      ? batscorecard(
                        lenth:
                            ls!
                                .scoreCard[1]
                                .batTeamDetails!
                                .batsmenData
                                .length,
                        batsman:
                            ls!.scoreCard[1].batTeamDetails!.batsmenData,
                        overs: ls!.scoreCard[1].scoreDetails!.overs,
                        teamnamess:
                            ls!
                                .scoreCard[1]
                                .batTeamDetails!
                                .batTeamShortName!,
                        teamrunsss: ls!.scoreCard[1].scoreDetails!.runs,
                        teamwicketsss:
                            ls!.scoreCard[1].scoreDetails!.wickets,
                        extradata: ls!.scoreCard[1].extrasData!,
                        bowlersData:
                            ls!.scoreCard[1].bowlTeamDetails!.bowlersData!,
                      )
                      : SizedBox(),
                  ls!.scoreCard.length > 2
                      ? batscorecard(
                        lenth:
                            ls!
                                .scoreCard[2]
                                .batTeamDetails!
                                .batsmenData
                                .length,
                        batsman:
                            ls!.scoreCard[2].batTeamDetails!.batsmenData,
                        overs: ls!.scoreCard[2].scoreDetails!.overs,
                        teamnamess:
                            ls!
                                .scoreCard[2]
                                .batTeamDetails!
                                .batTeamShortName!,
                        teamrunsss: ls!.scoreCard[2].scoreDetails!.runs,
                        teamwicketsss:
                            ls!.scoreCard[2].scoreDetails!.wickets,
                        extradata: ls!.scoreCard[2].extrasData!,
                        bowlersData:
                            ls!.scoreCard[2].bowlTeamDetails!.bowlersData!,
                      )
                      : SizedBox(),
                  ls!.scoreCard.length > 3
                      ? batscorecard(
                        lenth:
                            ls!
                                .scoreCard[3]
                                .batTeamDetails!
                                .batsmenData
                                .length,
                        batsman:
                            ls!.scoreCard[3].batTeamDetails!.batsmenData,
                        overs: ls!.scoreCard[3].scoreDetails!.overs,
                        teamnamess:
                            ls!
                                .scoreCard[3]
                                .batTeamDetails!
                                .batTeamShortName!,
                        teamrunsss: ls!.scoreCard[3].scoreDetails!.runs,
                        teamwicketsss:
                            ls!.scoreCard[3].scoreDetails!.wickets,
                        extradata: ls!.scoreCard[3].extrasData!,
                        bowlersData:
                            ls!.scoreCard[3].bowlTeamDetails!.bowlersData!,
                      )
                      : SizedBox(),
                ],
              ),
            ),
          )
          : Center(child: Lottie.asset("animation/loading.json")),
    );
  }

  Widget teamdetails({
    required String teamname,
    required int teamruns,
    required int teamwickets,
    required double overs,
  }) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade300),
      margin: EdgeInsets.all(0),
      child: Row(
        children: [
          SizedBox(width: 15),
          Text(teamname, style: TextStyle(fontSize: 20)),
          Spacer(),
          Row(
            children: [
              SizedBox(width: 15),
              Text("$teamruns-$teamwickets", style: TextStyle(fontSize: 20)),
              SizedBox(width: 10),
              Text("($overs)", style: TextStyle(fontSize: 20)),
              SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }

  Widget batscorecard({
    required int lenth,
    required Map batsman,
    required double overs,
    required String teamnamess,
    required int teamrunsss,
    required int teamwicketsss,
    required ExtrasData extradata,
    required BowlersData bowlersData,
  }) {
    return ExpansionTile(
      initiallyExpanded: true,
      tilePadding: EdgeInsets.all(0),
      title: teamdetails(
        teamname: teamnamess,
        teamruns: teamrunsss,
        teamwickets: teamwicketsss,
        overs: overs,
      ),
      showTrailingIcon: false,
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.grey.shade200),
          child: Row(
            children: [
              SizedBox(width: 16),
              SizedBox(
                width: (MediaQuery.of(context).size.width) * 0.40,
                child: Text("Batter", style: TextStyle(fontSize: 15)),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width) * 0.1,
                child: Text("R", style: TextStyle(fontSize: 15)),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width) * 0.1,
                child: Text("B", style: TextStyle(fontSize: 15)),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width) * 0.1,
                child: Text("4s", style: TextStyle(fontSize: 15)),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width) * 0.1,
                child: Text("6s", style: TextStyle(fontSize: 15)),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width) * 0.1,
                child: Text("SR", style: TextStyle(fontSize: 15)),
              ),
            ],
          ),
        ),
        ListView.builder(
          itemCount: lenth,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (batsman["bat_${index + 1}"] != null) {
              if (batsman["bat_${index + 1}"]!.outDesc != "") {
                return Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: ListTile(
                    subtitle: Text(
                      "${batsman["bat_${index + 1}"]!.outDesc}",
                      style: TextStyle(fontSize: 10, color: Colors.black38),
                    ),
                    title: Row(
                      children: [
                        SizedBox(
                          width: (MediaQuery.of(context).size.width) * 0.40,
                          child: Text(
                            "${batsman["bat_${index + 1}"]!.batName}",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width) * 0.1,
                          child: Text(
                            "${batsman["bat_${index + 1}"]!.runs}",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width) * 0.1,
                          child: Text(
                            "${batsman["bat_${index + 1}"]!.balls}",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width) * 0.1,
                          child: Text(
                            "${batsman["bat_${index + 1}"]!.fours}",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width) * 0.08,
                          child: Text(
                            "${batsman["bat_${index + 1}"]!.sixers}",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width) * 0.12,
                          child: Text(
                            "${batsman["bat_${index + 1}"]!.strikeRate}",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            }
            return null;
          },
        ),
        Align(
          alignment: Alignment(-0.9, 1),
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              children: [
                SizedBox(width: 15),
                Text("Extras"),
                Spacer(),
                Text(
                  "${extradata.total} (b ${extradata.byes}, lb ${extradata.legByes}, w ${extradata.wides}, nb ${extradata.noBalls} p ${extradata.penalty})",
                ),
                SizedBox(width: 15),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment(-0.9, 1),
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              children: [
                SizedBox(width: 15),
                Text("Total", style: TextStyle(fontSize: 20)),
                Spacer(),
                Text("$teamrunsss-$teamwicketsss ($overs)"),
                SizedBox(width: 15),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.grey.shade200),
          child: Row(
            children: [
              SizedBox(width: 16),
              SizedBox(
                width: (MediaQuery.of(context).size.width) * 0.40,
                child: Text("Bowler", style: TextStyle(fontSize: 20)),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width) * 0.1,
                child: Text("O", style: TextStyle(fontSize: 20)),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width) * 0.1,
                child: Text("M", style: TextStyle(fontSize: 20)),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width) * 0.1,
                child: Text("R", style: TextStyle(fontSize: 20)),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width) * 0.1,
                child: Text("W", style: TextStyle(fontSize: 20)),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width) * 0.1,
                child: Text("ER", style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
        bowlersData.bowl1 != null
            ? bowlteamdetails(bowlersData.bowl1!)
            : SizedBox(height: 1),
        bowlersData.bowl2 != null
            ? bowlteamdetails(bowlersData.bowl2!)
            : SizedBox(height: 1),
        bowlersData.bowl3 != null
            ? bowlteamdetails(bowlersData.bowl3!)
            : SizedBox(height: 1),
        bowlersData.bowl4 != null
            ? bowlteamdetails(bowlersData.bowl4!)
            : SizedBox(height: 1),
        bowlersData.bowl5 != null
            ? bowlteamdetails(bowlersData.bowl5!)
            : SizedBox(height: 1),
        bowlersData.bowl6 != null
            ? bowlteamdetails(bowlersData.bowl6!)
            : SizedBox(height: 1),
        bowlersData.bowl7 != null
            ? bowlteamdetails(bowlersData.bowl7!)
            : SizedBox(height: 1),
        bowlersData.bowl8 != null
            ? bowlteamdetails(bowlersData.bowl8!)
            : SizedBox(height: 1),
      ],
    );
  }

  Widget bowlteamdetails(Bowl bowler) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          SizedBox(width: 15),
          SizedBox(
            width: (MediaQuery.of(context).size.width) * 0.40,
            child: Text("${bowler.bowlName}", style: TextStyle(fontSize: 17)),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width) * 0.1,
            child: Text("${bowler.overs}", style: TextStyle(fontSize: 15)),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width) * 0.1,
            child: Text("${bowler.maidens}", style: TextStyle(fontSize: 15)),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width) * 0.1,
            child: Text("${bowler.runs}", style: TextStyle(fontSize: 15)),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width) * 0.1,
            child: Text("${bowler.wickets}", style: TextStyle(fontSize: 15)),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width) * 0.1,
            child: Text("${bowler.economy}", style: TextStyle(fontSize: 15)),
          ),
        ],
      ),
    );
  }

  Future<void> callapiscorecard({required int matchid}) async {
    var url = Uri.parse(
      "https://cricbuzz-cricket.p.rapidapi.com/mcenter/v1/$matchid/hscard",
    );
    var response = await http.get(
      url,
      headers: {
        'x-rapidapi-key': 'c5faf57887msh5112a96591fe94cp1f5c60jsn76204e778451',
        'x-rapidapi-host': 'cricbuzz-cricket.p.rapidapi.com',
      },
    );
    print("api called");
    var map = jsonDecode(response.body);
    ls = Livescorecardjson.fromJson(map);
    setState(() {});
  }
}
