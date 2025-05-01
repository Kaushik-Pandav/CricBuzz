import 'package:cricbuzz/live/livematchesjson.dart';
import 'package:flutter/material.dart';
import 'Scorecard/live_scorecard.dart';

class livematchesdetails extends StatefulWidget {
  livematchesdetails(this.seriesMatches, {super.key});

  SeriesMatches seriesMatches;

  @override
  State<livematchesdetails> createState() => _livematchesdetailsState();
}

class _livematchesdetailsState extends State<livematchesdetails> {

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
      body: Column(
        children: [
          SizedBox(height: 15),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.yellow.shade600),
            child: Text(
              " ${widget.seriesMatches.seriesAdWrapper!.seriesName}",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: widget.seriesMatches.seriesAdWrapper!.matches!.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade600,borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text(
                            "  ${widget.seriesMatches.seriesAdWrapper!.matches![index].matchInfo!.matchDesc} , ${widget.seriesMatches.seriesAdWrapper!.matches![index].matchInfo!.venueInfo!.city}",
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment(-0.9, -1),
                        child: Container(
                          height: (MediaQuery.of(context).size.height) * 0.1,
                          width: 400,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return livescorecard(
                                      matchid:
                                          widget
                                              .seriesMatches
                                              .seriesAdWrapper!
                                              .matches![index]
                                              .matchInfo!
                                              .matchId!,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 80,
                                      margin: EdgeInsets.only(top: 10, left: 10),
                                      child: Text(
                                        "${widget.seriesMatches.seriesAdWrapper!.matches![index].matchInfo!.team1!.teamSName}",
                                      ),
                                    ),
                                    (widget.seriesMatches.seriesAdWrapper!.matches![index].matchScore)!=null?Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text(
                                        "${widget.seriesMatches.seriesAdWrapper!.matches![index].matchScore!.team1Score!.inngs1!.runs??"0"}-${widget.seriesMatches.seriesAdWrapper!.matches![index].matchScore!.team1Score!.inngs1!.wickets??"0"}  (${widget.seriesMatches.seriesAdWrapper!.matches![index].matchScore!.team1Score!.inngs1!.overs??"0"})",
                                      ),
                                    ):SizedBox(),
                                    (widget
                                                .seriesMatches
                                                .seriesAdWrapper!
                                                .matches![index]
                                                .matchScore!=
                                            null&&widget.seriesMatches.seriesAdWrapper!.matches![index].matchScore!.team1Score!.inngs2!=null)
                                        ? Container(
                                          margin: EdgeInsets.only(top: 10),
                                          child: Text(
                                            " & ${widget.seriesMatches.seriesAdWrapper!.matches![index].matchScore!.team1Score!.inngs2!.runs??'0'}-${widget.seriesMatches.seriesAdWrapper!.matches![index].matchScore!.team1Score!.inngs2!.wickets??"0"}  (${widget.seriesMatches.seriesAdWrapper!.matches![index].matchScore!.team1Score!.inngs1!.overs??"0"})",
                                          ),
                                        )
                                        : SizedBox(width: 1),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 70,
                                      padding: EdgeInsets.only(top: 10, left: 10),
                                      child: Text(
                                        "${widget.seriesMatches.seriesAdWrapper!.matches![index].matchInfo!.team2!.teamSName}",
                                      ),
                                    ),
                                    (widget.seriesMatches.seriesAdWrapper!.matches![index].matchScore!.team2Score!=null&&widget.seriesMatches.seriesAdWrapper!.matches![index].matchScore!.team2Score!.inngs1!=null)?Container(
                                      padding: EdgeInsets.only(top: 10, left: 10),
                                      child: Text(
                                        "${widget.seriesMatches.seriesAdWrapper!.matches![index].matchScore!.team2Score!.inngs1!.runs??"0"}-${widget.seriesMatches.seriesAdWrapper!.matches![index].matchScore!.team2Score!.inngs1!.wickets??"0"}  (${widget.seriesMatches.seriesAdWrapper!.matches![index].matchScore!.team2Score!.inngs1!.overs??"0"})",
                                      ),
                                    ):SizedBox(),
                                    (widget
                                                .seriesMatches
                                                .seriesAdWrapper!
                                                .matches![index]
                                                .matchScore!.team2Score!=
                                            null&&widget.seriesMatches.seriesAdWrapper!.matches![index].matchScore!.team2Score!.inngs2!=null)
                                        ? Container(
                                          margin: EdgeInsets.only(top: 10),
                                          child: Text(
                                            " & ${widget.seriesMatches.seriesAdWrapper!.matches![index].matchScore!.team2Score!.inngs2!.runs}-${widget.seriesMatches.seriesAdWrapper!.matches![index].matchScore!.team2Score!.inngs2!.wickets}  (${widget.seriesMatches.seriesAdWrapper!.matches![index].matchScore!.team2Score!.inngs2!.overs??""})",
                                          ),
                                        )
                                        : SizedBox(width: 1),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment(-0.9, 0),
                                  child: Text(
                                    "${widget.seriesMatches.seriesAdWrapper!.matches![index].matchInfo!.status}",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
