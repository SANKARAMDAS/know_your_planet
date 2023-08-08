import 'dart:math';

import 'package:flutter/material.dart';
import 'package:know_your_planet/consts.dart';
import 'package:know_your_planet/models/planets.dart';
import 'package:know_your_planet/pages/detail_page.dart';
import 'package:know_your_planet/widgets/category_item.dart';
import 'package:know_your_planet/widgets/news_item.dart';
import 'package:know_your_planet/widgets/planet_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = [
    'all',
    'planets',
    'comets',
    'starts',
    'satellites'
  ];
  int selectedCategory = 1;
  PageController? pageController;
  double? pageOffset = 1;
  double viewPortFraction = 0.85;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController =
        PageController(initialPage: 1, viewportFraction: viewPortFraction)
          ..addListener(() {
            setState(() {
              pageOffset = pageController!.page;
            });
          });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: black,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.jpg',
            width: size.width,
            height: size.height,
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                          color: darkBlue.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12)),
                      child: const Icon(
                        Icons.grid_view_rounded,
                        color: darkBlue,
                      ),
                    ),
                    Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                          color: darkBlue.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12)),
                      child: const Icon(
                        Icons.search,
                        color: darkBlue,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Text(
                  'welcome !',
                  style: proportional.copyWith(fontSize: 32.0),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(
                      categories.length,
                      (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategory = index;
                            });
                          },
                          child: Padding(
                            padding: index == 0
                                ? const EdgeInsets.only(left: 22.0, right: 30.0)
                                : index == categories.length - 1
                                    ? const EdgeInsets.only(right: 22.0)
                                    : const EdgeInsets.only(right: 30.0),
                            child: CategoryItem(
                                category: categories[index],
                                selected: selectedCategory == index),
                          ))),
                ),
              ),
              const SizedBox(height: 20.0,),
              SizedBox(
                height: size.height * 0.5,
                child: PageView.builder(
                  itemCount: planets.length,
                  controller: pageController,
                  itemBuilder: (context, index) {
                    double scale = max(viewPortFraction,
                        (1 - (pageOffset! - index).abs() + viewPortFraction));
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context, MaterialPageRoute(builder: (context) => DetailPage(planet: planets[index]))
                        );
                      },
                      child: PlanetItem(planet: planets[index] ,size: size, viewPortFraction: viewPortFraction, scale: scale),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'astronomical news',
                      style:
                          proportional.copyWith(fontSize: 20.0, color: white),
                    ),
                    Text(
                      'see all',
                      style: proportional.copyWith(
                        fontSize: 20.0,
                        color: white.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0,),
              const NewsItem()
            ],
          ),
        ],
      ),
    );
  }
}





