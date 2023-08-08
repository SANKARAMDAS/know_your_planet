import 'package:flutter/material.dart';
import 'package:know_your_planet/consts.dart';
import 'package:know_your_planet/models/planets.dart';
import 'package:know_your_planet/widgets/category_item.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.planet});
  final PlanetsModel planet;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<String> categories = ['360', 'information', 'gallery'];
  int selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PlanetsModel planet = widget.planet;
    return Scaffold(
      // appBar: AppBar(),
      body: Stack(
        children: [
          Image.asset('assets/images/background.jpg', fit: BoxFit.cover, height: size.height,),
          Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap:() {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                            color: darkBlue.withOpacity(1),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: white,
                        ),
                      ),
                    ),
                    Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                          color: darkBlue.withOpacity(1),
                          borderRadius: BorderRadius.circular(12)),
                      child: const Icon(
                        Icons.more_vert_rounded,
                        color: white,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
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
              const SizedBox(height: 80.0,),
              Hero(
                tag: planet.image!,
                  child: Image.asset('assets/images/${planet.image}', width: size.width * 0.9,)),
              const SizedBox(height: 40,),
              Text(planet.name!, style: proportional.copyWith(fontSize: 32.0),),const SizedBox(height: 40.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('size', style: proportional.copyWith(color: blue, fontSize: 18.0) ,),
                        const SizedBox(height: 20.0,),
                        Text('d =${NumberFormat('###,000.#', "id_ID").format(planet.size).replaceAll('.', ' ')} km', style: montserrat.copyWith(
                          color: white, fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                    Column(
                      children: [
                        Text('distance from Sun', style: proportional.copyWith(color: blue, fontSize: 18.0) ,),
                        const SizedBox(height: 20.0,),
                        Text('d =${NumberFormat('###,000.#', "id_ID").format(planet.size).replaceAll('.', ' ')} km', style: montserrat.copyWith(
                            color: white, fontWeight: FontWeight.bold
                        ),)
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}


