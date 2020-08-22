import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final List<String> images = [
  'assets/images/carousel/cernicalo.png',
  'assets/images/carousel/giramos.png',
  'assets/images/carousel/guateque.png',
  'assets/images/carousel/pol_omedes.png',
  'assets/images/carousel/saphie_wells.png'
];

final List<String> places = [
  'Cernícalo',
  'Giramos',
  'Guateque Productions',
  'Pol Omedes',
  'Saphie Wells',
];

List<Widget> generateImageTiles(screenSize) {
  return images
      .map(
        (element) => ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            element,
            fit: BoxFit.cover,
          ),
        ),
      )
      .toList();
}

int _current = 0;

class HomeScreenCarousel extends StatefulWidget {
  @override
  _HomeScreenCarouselState createState() => _HomeScreenCarouselState();
}

class _HomeScreenCarouselState extends State<HomeScreenCarousel> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);
    final CarouselController _controller = CarouselController();

    return Container(
      width: screenSize.width,
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Last Works',
                style: GoogleFonts.montserrat(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Stack(
            children: [
              CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(
                    enlargeCenterPage: true,
                    aspectRatio: 18 / 8,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
                carouselController: _controller,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
