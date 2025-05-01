import 'dart:convert';
import 'package:cricbuzz/recent/scorecard/recentscorecardjson.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class recentscorecardddd extends StatefulWidget {
  recentscorecardddd({super.key, required this.matchid});

  final int matchid;

  @override
  State<recentscorecardddd> createState() => _recentscorecarddddState();
}

class _recentscorecarddddState extends State<recentscorecardddd> {
  Recentscorecard? rs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callscorecardapi(widget.matchid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          rs != null
              ? SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: (MediaQuery.of(context).size.height) * 0.12,
                      decoration: BoxDecoration(color: Colors.yellow.shade600),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.yellow.shade600,
                            ),
                            child: Column(
                             children: [ Align(
                               alignment: Alignment(-0.9, 1),
                               child: Text(
                                 "${rs!.matchHeader!.status}",
                                 style: TextStyle(
                                   fontSize: 17,
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
                                       width: 70,
                                       child: Text(
                                         "${rs!.scoreCard[0].batTeamDetails!.batTeamShortName}",
                                         style: TextStyle(fontSize: 25),
                                       ),
                                     ),
                                   ),
                                   Text(
                                     "${rs!.scoreCard[0].scoreDetails!.runs}-${rs!.scoreCard[0].scoreDetails!.wickets} (${rs!.scoreCard[0].scoreDetails!.overs})",
                                     style: TextStyle(fontSize: 25),
                                   ),
                                 ],
                               ),],
                            ),
                          ),

                          rs!.scoreCard.length > 1
                              ? Row(
                                children: [
                                  SizedBox(width: 15),
                                  Align(
                                    child: SizedBox(
                                      width: 70,
                                      child: Text(
                                        "${rs!.scoreCard[1].batTeamDetails!.batTeamShortName}",
                                        style: TextStyle(fontSize: 25),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${rs!.scoreCard[1].scoreDetails!.runs}-${rs!.scoreCard[1].scoreDetails!.wickets} (${rs!.scoreCard[1].scoreDetails!.overs})",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ],
                              )
                              : SizedBox(),
                        ],
                      ),
                    ),
                    rs!.matchHeader != null
                        ? Container(
                      margin: EdgeInsets.only(top: 15,bottom: 15),
                          decoration: BoxDecoration(
                            color: Colors.green
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 3,),
                              Align(
                                alignment: Alignment(-0.9, -1),
                                child: Text(
                                  "Player of The Match",
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),
                                ),
                              ),
                              Align(
                                alignment: Alignment(-0.9, -1),
                                child: Text(
                                  "${rs!.matchHeader!.playersOfTheMatch[0].fullName}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        : SizedBox(),
                    rs!.scoreCard.isNotEmpty
                        ? batscorecard(
                          lenth:
                              rs!
                                  .scoreCard[0]
                                  .batTeamDetails!
                                  .batsmenData
                                  .length,
                          batsman: rs!.scoreCard[0].batTeamDetails!.batsmenData,
                          overs: rs!.scoreCard[0].scoreDetails!.overs,
                          teamnamess:
                              rs!
                                  .scoreCard[0]
                                  .batTeamDetails!
                                  .batTeamShortName!,
                          teamrunsss: rs!.scoreCard[0].scoreDetails!.runs,
                          teamwicketsss: rs!.scoreCard[0].scoreDetails!.wickets,
                          extradata: rs!.scoreCard[0].extrasData!,
                          bowlersData:
                              rs!.scoreCard[0].bowlTeamDetails!.bowlersData!,
                        )
                        : SizedBox(child: Text("Match Yet to Start")),
                    rs!.scoreCard.length > 1
                        ? batscorecard(
                          lenth:
                              rs!
                                  .scoreCard[1]
                                  .batTeamDetails!
                                  .batsmenData
                                  .length,
                          batsman: rs!.scoreCard[1].batTeamDetails!.batsmenData,
                          overs: rs!.scoreCard[1].scoreDetails!.overs,
                          teamnamess:
                              rs!
                                  .scoreCard[1]
                                  .batTeamDetails!
                                  .batTeamShortName!,
                          teamrunsss: rs!.scoreCard[1].scoreDetails!.runs,
                          teamwicketsss: rs!.scoreCard[1].scoreDetails!.wickets,
                          extradata: rs!.scoreCard[1].extrasData!,
                          bowlersData:
                              rs!.scoreCard[1].bowlTeamDetails!.bowlersData!,
                        )
                        : SizedBox(),
                    rs!.scoreCard.length > 2
                        ? batscorecard(
                          lenth:
                              rs!
                                  .scoreCard[2]
                                  .batTeamDetails!
                                  .batsmenData
                                  .length,
                          batsman: rs!.scoreCard[2].batTeamDetails!.batsmenData,
                          overs: rs!.scoreCard[2].scoreDetails!.overs,
                          teamnamess:
                              rs!
                                  .scoreCard[2]
                                  .batTeamDetails!
                                  .batTeamShortName!,
                          teamrunsss: rs!.scoreCard[2].scoreDetails!.runs,
                          teamwicketsss: rs!.scoreCard[2].scoreDetails!.wickets,
                          extradata: rs!.scoreCard[2].extrasData!,
                          bowlersData:
                              rs!.scoreCard[2].bowlTeamDetails!.bowlersData!,
                        )
                        : SizedBox(),
                    rs!.scoreCard.length > 3
                        ? batscorecard(
                          lenth:
                              rs!
                                  .scoreCard[3]
                                  .batTeamDetails!
                                  .batsmenData
                                  .length,
                          batsman: rs!.scoreCard[3].batTeamDetails!.batsmenData,
                          overs: rs!.scoreCard[3].scoreDetails!.overs,
                          teamnamess:
                              rs!
                                  .scoreCard[3]
                                  .batTeamDetails!
                                  .batTeamShortName!,
                          teamrunsss: rs!.scoreCard[3].scoreDetails!.runs,
                          teamwicketsss: rs!.scoreCard[3].scoreDetails!.wickets,
                          extradata: rs!.scoreCard[3].extrasData!,
                          bowlersData:
                              rs!.scoreCard[3].bowlTeamDetails!.bowlersData!,
                        )
                        : SizedBox(),
                  ],
                ),
              )
              : Center(child: Lottie.asset("animation/loading.json"),),
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
      initiallyExpanded: Lottie.traceEnabled,
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
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
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
          },
        ),
        Align(
          alignment: Alignment(-0.9, 1),
          child: Container(
            decoration:
            BoxDecoration(
              color: Colors.white
            ),
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
          child: Container
            ( decoration:
          BoxDecoration(
              color: Colors.white
          ),
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
        rs!.scoreCard[0].bowlTeamDetails!.bowlersData!.bowl1 != null
            ? bowlteamdetails(bowlersData.bowl1!)
            : SizedBox(height: 1),
        rs!.scoreCard[0].bowlTeamDetails!.bowlersData!.bowl2 != null
            ? bowlteamdetails(bowlersData.bowl2!)
            : SizedBox(height: 1),
        rs!.scoreCard[0].bowlTeamDetails!.bowlersData!.bowl3 != null
            ? bowlteamdetails(bowlersData.bowl3!)
            : SizedBox(height: 1),
        rs!.scoreCard[0].bowlTeamDetails!.bowlersData!.bowl4 != null
            ? bowlteamdetails(bowlersData.bowl4!)
            : SizedBox(height: 1),
        rs!.scoreCard[0].bowlTeamDetails!.bowlersData!.bowl5 != null
            ? bowlteamdetails(bowlersData.bowl5!)
            : SizedBox(height: 1),
        rs!.scoreCard[0].bowlTeamDetails!.bowlersData!.bowl6 != null
            ? bowlteamdetails(bowlersData.bowl6!)
            : SizedBox(height: 1),

      ],
    );
  }

  Widget bowlteamdetails(Bowl bowler) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      decoration:
      BoxDecoration(
          color: Colors.white
      ),
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

  Future<void> callscorecardapi(int matchid) async {
    var url = Uri.parse(
      "https://cricbuzz-cricket.p.rapidapi.com/mcenter/v1/$matchid/hscard",
    );
    var responsew = await http.get(
      url,
        headers: {
          'x-rapidapi-key': 'c5faf57887msh5112a96591fe94cp1f5c60jsn76204e778451',
          'x-rapidapi-host': 'cricbuzz-cricket.p.rapidapi.com'
        }
    );
    var map = jsonDecode(responsew.body);
    rs = Recentscorecard.fromJson(map);
    setState(() {});
  }
}
