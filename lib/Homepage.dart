import 'package:cricbuzz/live/livematch.dart';
import 'package:cricbuzz/recent/recentmatches.dart';
import 'package:cricbuzz/upcoming/upcomingmatches.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

BannerAd? _bannerAd;
bool _isLoaded = false;
final adUnitId = "ca-app-pub-3940256099942544/6300978111";
RewardedAd? _rewardedAd;

class _HomepageState extends State<Homepage> {


  @override
  void initState() {
    super.initState();
    loadAd();
    loadAdint();
    loadAdREWARD();
  }

  InterstitialAd? _interstitialAd;
  final adUnitIdint = 'ca-app-pub-3940256099942544/1033173712';
  void loadAdint() {
    InterstitialAd.load(
      adUnitId: adUnitIdint,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              loadAdint();
            },
          );
          debugPrint('$ad loaded.');
          setState(() {
            _interstitialAd = ad;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('InterstitialAd failed to load: $error');
        },
      ),
    );
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
      body: Stack(
        children: [
          _isLoaded
              ? Align(
                alignment: Alignment.bottomCenter,
                child: SafeArea(
                  child: SizedBox(
                    width: _bannerAd!.size.width.toDouble(),
                    height: _bannerAd!.size.height.toDouble(),
                    child: AdWidget(ad: _bannerAd!),
                  ),
                ),
              )
              : Align(
                alignment: Alignment.bottomCenter,
                child: SafeArea(
                  child: SizedBox(
                    width: _bannerAd!.size.width.toDouble(),
                    height: _bannerAd!.size.height.toDouble(),
                    child: Container(
                      color: Colors.yellow,
                      child: Center(child: Text("Ads SPACE")),
                    ),
                  ),
                ),
              ),
          Column(
            children: [
              Center(),
              status(
                "Live Matches",
                OnTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Livematch()),
                  );
                },
              ),
              status(
                "Upcoming Matches",
                OnTap: () {
                  _rewardedAd != null
                      ? _rewardedAd!.show(
                        onUserEarnedReward: (ad, reward) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Upcomingmatches();
                              },
                            ),
                          );
                        },
                      )
                      : Future.delayed(Duration(seconds: 2)).then((value) {
                        return Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Upcomingmatches();
                            },
                          ),
                        );
                      });
                },
              ),
              status(
                "Recent Matches",
                OnTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return recentmatches();
                      },
                    ),
                  );
                },
              ),
              InkWell(
                onTap: () {
                  if (_interstitialAd != null) {
                    _interstitialAd!.show();
                  }
                },
                child: Text("Showads"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget status(String data, {required Function() OnTap}) {
    return Card(
      elevation: 15,
      color: Colors.yellow.shade600,
      child: SizedBox(
        height: (MediaQuery.of(context).size.height) * 0.20,
        child: InkWell(
          splashColor: Colors.white,
          onTap: OnTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                data,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              Icon(Icons.navigate_next_rounded, size: 45),
            ],
          ),
        ),
      ),
    );
  }

  void loadAdREWARD() {
    RewardedAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/5224354917',
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          _rewardedAd = ad;
          loadAdREWARD();
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('RewardedAd failed to load: $error');
          loadAdREWARD();
        },
      ),
    );
  }

  void loadAd() async {
    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.largeBanner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          setState(() {
            _isLoaded = true;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          // Dispose the ad here to free resources.
          ad.dispose();
          loadAd();
        },
      ),
    )..load();
  }
}
