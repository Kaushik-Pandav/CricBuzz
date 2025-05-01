import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'Homepage.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState5
    super.initState();
    Future.delayed(Duration(seconds: 4)).then((value) {
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Homepage();
      },));
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "Assets/CRICBUZZ (1).jpg",
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fitHeight,
          ),
          Column(
            children: [
              SizedBox(height: (MediaQuery.of(context).size.height)*0.4,),
              Center(
                child: Lottie.asset("animation/splashscreen.json",height: 400,width: 600,fit: BoxFit.fill),
              ),
            ],
          )

        ],
      ),
    );
  }
}
