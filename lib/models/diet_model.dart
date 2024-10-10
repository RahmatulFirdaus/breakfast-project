import 'package:flutter/material.dart';

class DietModel{
  String nameItem;
  String iconPath;
  String difficulty;
  String time;
  String calories;
  Color boxColor;
  bool viewIsSelected;

  DietModel({
    required this.nameItem,
    required this.iconPath,
    required this.difficulty,
    required this.calories,
    required this.time,
    required this.boxColor,
    required this.viewIsSelected,
  });

  static List<DietModel> getDiet(){
    List<DietModel> diets = [];

    diets.add(
      DietModel(
        nameItem: "Honey Pancake",
        iconPath: "assets/pancakes.svg",
        difficulty: "Easy",
        time: "30mins",
        calories: "180kCal",
        viewIsSelected: true,
        boxColor: const Color(0xff92A3FD),
      )
    );
    diets.add(
      DietModel(
        nameItem: "Sushi",
        iconPath: "assets/sushi.svg",
        difficulty: "Easy",
        time: "30mins",
        calories: "180kCal",
        viewIsSelected: false,
        boxColor: const Color(0xffC588F2)
      )
    );
    
    return diets;
  }
}