import 'package:flutter/material.dart';

class CategoryModel {
  String nameItem;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.nameItem,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories(){
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        nameItem: "Salad", 
        iconPath: 'assets/salad.svg', 
        boxColor: const Color(0xff92A3FD),
      )
    );

    categories.add(
      CategoryModel(
        nameItem: "Cake", 
        iconPath: 'assets/cake.svg', 
        boxColor: const Color(0xffC588F2)
      )
    );

    categories.add(
      CategoryModel(
        nameItem: "Pancakes", 
        iconPath: 'assets/pancakes.svg', 
        boxColor: const Color(0xff92A3FD)
      )
    );
    
    categories.add(
      CategoryModel(
        nameItem: "Pie", 
        iconPath: 'assets/pie.svg', 
        boxColor: const Color(0xffC588F2)
      )
    );

    categories.add(
      CategoryModel(
        nameItem: "Smoothies", 
        iconPath: 'assets/juice.svg', 
        boxColor: const Color(0xff92A3FD)
      )
    );

    return categories;
  }
}