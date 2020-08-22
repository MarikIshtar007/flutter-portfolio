import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:myPortfolio/theme/dark_theme.dart';
import 'components/rss_feed.dart';
import 'screens/home_screen/home_screen.dart';
import 'theme/bright_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) {
        return brightness == Brightness.light
            ? brightTheme(brightness)
            : darkTheme(brightness);
      },
      themedWidgetBuilder: (context, data) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Joan Subirats',
        theme: data,
        home: HomeScreen(),
      ),
    );
  }
}
