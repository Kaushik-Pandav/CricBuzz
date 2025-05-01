import 'package:cricbuzz/upcoming/upcomingmatchesjson.dart';
import 'package:flutter/material.dart';

class details extends StatefulWidget {
  details(this.seriesMatch);

  SeriesMatch seriesMatch;

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.deepPurple.shade800,
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
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.seriesMatch.seriesAdWrapper!.matches.length,
              itemBuilder: (context, index) {
                if (widget.seriesMatch.seriesAdWrapper != null) {
                  return Card(
                    elevation: 3,color: Colors.yellow.shade600,
                    child: Center(
                      child: SizedBox(
                        height:
                            (MediaQuery.of(context).size.height) * 0.13,
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment(-1, 0),
                              child: Text(
                                "   ${widget.seriesMatch.seriesAdWrapper!.matches[index].matchInfo!.matchDesc}",
                                style: TextStyle(color: Colors.black,fontSize: 17),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-1, 0),
                              child: Text(
                                " ${widget.seriesMatch.seriesAdWrapper!.matches[index].matchInfo!.team1!.teamName} ",
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-1, 0),
                              child: Text(
                                " ${widget.seriesMatch.seriesAdWrapper!.matches[index].matchInfo!.team2!.teamName}",
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
                              ),
                            ),

                            Align(
                              alignment: Alignment(-1, -1),
                              child: Text(
                                "  ${widget.seriesMatch.seriesAdWrapper!.matches[index].matchInfo!.status}",style: TextStyle(
                                fontSize: 17
                              ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
