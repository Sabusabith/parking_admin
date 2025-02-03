import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderImage extends StatelessWidget {
  const SliderImage({
    super.key,
    required this.carouselController,
    required this.onPageChanged,
  });

  final CarouselSliderController carouselController;
  final ValueChanged<int> onPageChanged;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CarouselSlider(
      carouselController: carouselController,
      options: CarouselOptions(
        height: 190.0,
        autoPlay: false,
        enlargeCenterPage: true,
        viewportFraction: 1.0,
        aspectRatio: 16 / 9,
        onPageChanged: (index, reason) {
          onPageChanged(index); // Notify parent widget of page change
        },
      ),
      items: [
        'assets/images/s1.png',
        'assets/images/s1.png',
        'assets/images/s1.png',
        'assets/images/s1.png',
      ]
          .map((item) => Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        item,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ))
          .toList(),
    );
  }
}
