import 'package:cricbuzz/recent/recentmatchesdetails.dart';
import 'package:cricbuzz/recent/recentmatchesjson.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Matchdata extends StatefulWidget {
  Matchdata(this.typeMatch);

  TypeMatches typeMatch;

  @override
  State<Matchdata> createState() => _MatchdataState();
}

class _MatchdataState extends State<Matchdata> {
  NativeAd? _nativeAd;
  bool _nativeAdIsLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAd();
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
      body: ListView.builder(
        itemCount: widget.typeMatch.seriesMatches!.length,
        itemBuilder: (context, index) {
          if (widget.typeMatch.seriesMatches![index].seriesAdWrapper != null) {
            return Card(
              elevation: 3,
              color: Colors.yellow.shade600,
              child: SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.15,
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return recentmatchdetails(
                            widget.typeMatch.seriesMatches![index],
                          );
                        },
                      ),
                    );
                  },
                  title: Center(
                    child: Row(
                      children: [
                        Text(
                          "${widget.typeMatch.seriesMatches![index].seriesAdWrapper!.seriesName}",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.navigate_next, size: 45),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            if (!_nativeAdIsLoaded) {
              return null;
            } else {
              return ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 320, // minimum recommended width
                    minHeight: 320, // minimum recommended height
                    maxWidth: 400,
                    maxHeight: 400,
                  ),
                  child: AdWidget(ad: _nativeAd!),
                );
            }
          }
        },
      ),
    );
  }

  void loadAd() {
    _nativeAd = NativeAd(
      adUnitId: "ca-app-pub-3940256099942544/2247696110",
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          debugPrint('$NativeAd loaded.');
          setState(() {
            _nativeAdIsLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          // Dispose the ad here to free resources.
          debugPrint('$NativeAd failed to load: $error');
          ad.dispose();
        },
      ),
      request: const AdRequest(),
      // Styling
      nativeTemplateStyle: NativeTemplateStyle(
        // Required: Choose a template.
        templateType: TemplateType.medium,
        // Optional: Customize the ad's style.
        mainBackgroundColor: Colors.white,
        cornerRadius: 10.0,
        callToActionTextStyle: NativeTemplateTextStyle(
          textColor: Colors.cyan,
          backgroundColor: Colors.red,
          style: NativeTemplateFontStyle.monospace,
          size: 16.0,
        ),
        primaryTextStyle: NativeTemplateTextStyle(
          textColor: Colors.red,
          backgroundColor: Colors.cyan,
          style: NativeTemplateFontStyle.italic,
          size: 16.0,
        ),
        secondaryTextStyle: NativeTemplateTextStyle(
          textColor: Colors.green,
          backgroundColor: Colors.black,
          style: NativeTemplateFontStyle.bold,
          size: 16.0,
        ),
        tertiaryTextStyle: NativeTemplateTextStyle(
          textColor: Colors.brown,
          backgroundColor: Colors.amber,
          style: NativeTemplateFontStyle.normal,
          size: 16.0,
        ),
      ),
    )..load();
  }
}
