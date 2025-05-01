import 'package:cricbuzz/recent/recentmatchesjson.dart';
import 'package:cricbuzz/recent/scorecard/recentscorecard.dart';
import 'package:flutter/material.dart';

class recentmatchdetails extends StatefulWidget {
  recentmatchdetails(this.seriesMatches);

  SeriesMatches seriesMatches;

  @override
  State<recentmatchdetails> createState() => _recentmatchdetailsState();
}

class _recentmatchdetailsState extends State<recentmatchdetails> {
  double? t1over;
  double? t12over;
  double? t22over;

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
            decoration: BoxDecoration(color:Colors.yellow.shade600),
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
                return Card(
                  elevation: 3,color: Colors.yellow.shade600,
                  child: SizedBox(
                    height: (MediaQuery.of(context).size.height)*0.15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Text(
                              "  ${widget.seriesMatches.seriesAdWrapper!.matches![index].matchInfo!.matchDesc} , ${widget.seriesMatches.seriesAdWrapper!.matches![index].matchInfo!.venueInfo!.city}",
                              style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment(-0.9, -1),
                          child: SizedBox(
                            height: (MediaQuery.of(context).size.height) * 0.1,
                            width: 400,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return recentscorecardddd(
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
                                        width: 70,
                                        margin: EdgeInsets.only(top: 10, left: 10),
                                        child: Text(
                                          "${widget.seriesMatches.seriesAdWrapper!.matches![index].matchInfo!.team1!.teamSName}",style: TextStyle(
                                          fontSize: 17,fontWeight: FontWeight.w600
                                        ),
                                        ),
                                      ),
                                      (widget
                                                  .seriesMatches
                                                  .seriesAdWrapper!
                                                  .matches![index]
                                                  .matchScore !=
                                              null)
                                          ? Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: Text(
                                              "${widget.seriesMatches.seriesAdWrapper!.matches![index].matchScore!.team1Score!.inngs1!.runs}-${widget.seriesMatches.seriesAdWrapper!.matches![index].matchScore!.team1Score!.inngs1!.wickets}  (${widget.seriesMatches.seriesAdWrapper!.matches![index].matchScore!.team1Score!.inngs1!.overs!})",style: TextStyle(
                                                fontSize: 17,fontWeight: FontWeight.w600
                                            ),
                                            ),
                                          )
                                          : SizedBox(),
                                      (widget
                                                      .seriesMatches
                                                      .seriesAdWrapper!
                                                      .matches![index]
                                                      .matchScore !=
                                                  null &&
                                              widget
                                                      .seriesMatches
                                                      .seriesAdWrapper!
                                                      .matches![index]
                                                      .matchScore!
                                                      .team1Score!
                                                      .inngs2 !=
                                                  null)
                                          ? Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: Text(
                                              " & ${widget.seriesMatches.seriesAdWrapper!.matches![index].matchScore!.team1Score!.inngs2!.runs}-${widget.seriesMatches.seriesAdWrapper!.matches![index].matchScore!.team1Score!.inngs2!.wickets}  (${widget.seriesMatches.seriesAdWrapper!.matches![index].matchScore!.team1Score!.inngs2!.overs})",style: TextStyle(
                                                fontSize: 17,fontWeight: FontWeight.w600                                            ),
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
                                          "${widget.seriesMatches.seriesAdWrapper!.matches![index].matchInfo!.team2!.teamSName}",style: TextStyle(
                                            fontSize: 17,fontWeight: FontWeight.w600
                                        ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 10, left: 10),
                                        child:
                                            widget
                                                        .seriesMatches
                                                        .seriesAdWrapper!
                                                        .matches![index]
                                                        .matchScore !=
                                                    null
                                                ? Text(
                                                  "${widget.seriesMatches.seriesAdWrapper!.matches![index].matchScore!.team2Score!.inngs1!.runs}-${widget.seriesMatches.seriesAdWrapper!.matches![index].matchScore!.team2Score!.inngs1!.wickets}  (${widget.seriesMatches.seriesAdWrapper!.matches![index].matchScore!.team2Score!.inngs1!.overs!})",style: TextStyle(
                                                fontSize: 17,fontWeight: FontWeight.w600
                                            ),
                                                )
                                                : SizedBox(),
                                      ),
                                      (widget
                                                      .seriesMatches
                                                      .seriesAdWrapper!
                                                      .matches![index]
                                                      .matchScore !=
                                                  null &&
                                              widget
                                                      .seriesMatches
                                                      .seriesAdWrapper!
                                                      .matches![index]
                                                      .matchScore!
                                                      .team2Score!
                                                      .inngs2 !=
                                                  null)
                                          ? Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: Text(
                                              " & ${widget.seriesMatches.seriesAdWrapper!.matches![index].matchScore!.team2Score!.inngs2!.runs}-${widget.seriesMatches.seriesAdWrapper!.matches![index].matchScore!.team2Score!.inngs2!.wickets}  (${widget.seriesMatches.seriesAdWrapper!.matches![index].matchScore!.team2Score!.inngs2!.overs})",style: TextStyle(
                                                fontSize: 17,fontWeight: FontWeight.w600
                                            ),
                                            ),
                                          )
                                          : SizedBox(width: 1),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment(-0.9, 0),
                                    child: Text(
                                      "${widget.seriesMatches.seriesAdWrapper!.matches![index].matchInfo!.status}",
                                      style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
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
