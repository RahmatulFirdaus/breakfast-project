import 'package:flutter/material.dart';

class PopularModel {
  String nameItem;
  String iconPath;
  String difficulty;
  String time;
  String calories;
  Color boxColor;
  bool viewIsSelected;

  PopularModel({
    required this.nameItem,
    required this.iconPath,
    required this.difficulty,
    required this.time,
    required this.calories,
    required this.boxColor,
    required this.viewIsSelected
  });

  static List<PopularModel> getPopular(){
    List<PopularModel> popular = [];

    popular.add(
      PopularModel(
        nameItem: "BlueBerry Pancake",
        iconPath: "assets/bpancakes.svg",
        difficulty: "Medium", 
        time: "25mins", 
        calories: "240kCal", 
        boxColor: Colors.white, 
        viewIsSelected: true
      )
    );

     popular.add(
      PopularModel(
        nameItem: "Salmon Nigiri",
        iconPath: "assets/sushinigiri.svg",
        difficulty: "Medium", 
        time: "25mins", 
        calories: "240kCal", 
        boxColor: Colors.white, 
        viewIsSelected: false
      )
    );

    return popular;
  }
}