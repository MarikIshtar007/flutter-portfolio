import 'package:flutter/material.dart';
import 'package:myPortfolio/constants.dart';

class HomeScreenHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
//          Container(
//            child: Image.asset('images/japan_pattern_4.jpg',
////              fit: BoxFit.cover,
//              repeat: ImageRepeat.repeat,
//            ),
//            height: screenSize.height * 0.65,
//            width: screenSize.width,
//          ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            height: screenSize.height * 0.65,
            width: screenSize.width,
            child: Image.asset(
              'assets/images/header/joan_subirats_bg-removebg.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        Center(
          heightFactor: 1,
          child: Padding(
            padding: EdgeInsets.only(
              top: screenSize.width > 590.0 ? screenSize.height * 0.58 : screenSize.height * 0.48,
              left: screenSize.width / 5,
              right: screenSize.width / 5,
            ),
            child: Card(
              elevation: 3.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 25.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Hi! I\'m Joan Subirats, a musician and developer based in Barcelona',
                      style: kGFontsBody.copyWith(fontSize: 30.0),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Follow me on Instagram, Github, LinkedIn or Twitter',
                      style: kGFontsBody.copyWith(fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}