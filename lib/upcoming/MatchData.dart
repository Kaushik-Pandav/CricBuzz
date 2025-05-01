import 'package:cricbuzz/upcoming/upcomingdetails.dart';
import 'package:cricbuzz/upcoming/upcomingmatchesjson.dart';
import 'package:flutter/material.dart';

class MatchData extends StatefulWidget {
  MatchData(this.typeMatch);

  final TypeMatch typeMatch;

  @override
  State<MatchData> createState() => _detailsState();
}

class _detailsState extends State<MatchData> {
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
              itemCount: widget.typeMatch.seriesMatches.length,
              itemBuilder: (context, index) {
                if (widget.typeMatch.seriesMatches[index].seriesAdWrapper !=
                    null) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return details(widget.typeMatch.seriesMatches[index]);
                      },));
                    },
                    child: Card(
                      color: Colors.yellow.shade600,
                      elevation: 3,
                      child: SizedBox(
                        height:( MediaQuery.of(context).size.height)*0.15,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(height: 10),
                              Text(
                                "${widget.typeMatch.seriesMatches[index].seriesAdWrapper!.matches[index].matchInfo!.seriesName}",
                                style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w600),
                              ),
                              Divider(),Icon(Icons.navigate_next,size: 45,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
                else {
                  return ListTile(
                    title: Text("${widget.typeMatch.seriesMatches[index].adDetail}"),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
