import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:myPortfolio/components/app_bar/app_bar_drawer.dart';
import 'package:myPortfolio/components/bottom_bar.dart';
import 'package:myPortfolio/services/responsive_breakpoints.dart';

import 'components/home_screen_carousel.dart';
import 'components/home_screen_featured.dart';
import 'components/home_screen_header.dart';

String flareAnimation = 'night_idle';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  Future switchFutureNight() async {
    Future waiting;
    flareAnimation = 'switch_night';
    waiting = await Future.delayed( Duration(milliseconds: 500));
    setState(() {
      flareAnimation = 'night_idle';
    });
  }

  Future switchFutureDay() async {
    Future waiting;
    flareAnimation = 'switch_day';
    waiting = await Future.delayed( Duration(milliseconds: 500));
    setState(() {
      flareAnimation = 'day_idle';
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: ResponsiveWidget.isSmallScreen(context),
        title: Text(
          'Joan Subirats',
        ),
        actions: [
          Visibility(
            visible: ResponsiveWidget.isSmallScreen(context) != true,
            child: Row(
              children: [
                FlatButton(
                  child: Text('Item 1'),
                  onPressed: () {},
                ),
                FlatButton(
                  child: Text('Item 1'),
                  onPressed: () {},
                ),
                FlatButton(
                  child: Text('Item 1'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Container(
            height: 80.0,
            width: 80.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Theme.of(context).brightness == Brightness.dark
                        ? switchFutureNight()
                        : switchFutureDay();
                  });
                  DynamicTheme.of(context).setBrightness(
                      Theme.of(context).brightness == Brightness.dark
                          ? Brightness.light
                          : Brightness.dark);
                },
                child: FlareActor(
                  'assets/images/rive/switch_daytime.flr',
                  animation: flareAnimation,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: ResponsiveWidget.isSmallScreen(context) ? appBarDrawer : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeScreenHeader(),
            SizedBox(
              height: 50.0,
            ),
            HomeScreenFeatured(),
            SizedBox(
              height: 50.0,
            ),
            HomeScreenCarousel(),
            SizedBox(
              height: 50.0,
            ),
            BottomBar()
          ],
        ),
      ),
    );
  }
}