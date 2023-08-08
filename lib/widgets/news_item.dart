import 'package:flutter/material.dart';
import 'package:know_your_planet/consts.dart';
import 'package:know_your_planet/models/planets.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22.0),
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: darkBlue, borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('How humans pick\nout constellation', style: montserrat.copyWith(fontSize: 16.0, height: 1.5),),
              const Icon(Icons.arrow_forward_ios_rounded, color: blue,),
            ],
          ),
          const SizedBox(height: 16.0,),
          Text(astronomicalNews,maxLines: 4, overflow: TextOverflow.clip,
            style: montserrat.copyWith(
                fontSize: 12.0,
                color: white,
                height: 1.5,
                letterSpacing: 1
            ),)
        ],
      ),
    );
  }
}