import 'package:breakfeast/models/category_model.dart';
import 'package:breakfeast/models/diet_model.dart';
import 'package:breakfeast/models/popular_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularModel> popular = [];

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiet();
    popular = PopularModel.getPopular();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: navigasi(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          searchMenu(),
          const SizedBox(
            height: 20,
          ),
          categorySelection(categories: categories),
          const SizedBox(
            height: 30,
          ),
          dietSelection(),
          const SizedBox(height: 30,),
          popularSelection()
        ],
      ),
    );
  }

  Column popularSelection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text("Popular",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.black
              ),
              ),
            ),
            ListView.separated(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
              itemCount: popular.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(height: 20,),
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: popular[index].boxColor,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(0, 10),
                        blurRadius: 40,
                        spreadRadius: 0,
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SvgPicture.asset(popular[index].iconPath, width: 80,),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(popular[index].nameItem,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 16
                            ),
                            ),
                            Text(popular[index].difficulty+"/"+popular[index].time+"/"+popular[index].calories,
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: GestureDetector(
                            onTap: (){},
                            child: const Icon(
                              Icons.chevron_right_rounded,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        );
  }

  Column dietSelection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                "Recommendation\nfor Diet",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 20),
              height: 250,
              // color: Colors.black,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: diets[index].boxColor.withOpacity(0.4)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            diets[index].iconPath,
                            width: 110,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              diets[index].nameItem,
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text("${diets[index].difficulty}/${diets[index].time}/${diets[index].calories}"),
                          ],
                        ),
                        Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                              colors: [
                                diets[index].viewIsSelected ? const Color.fromARGB(255, 136, 201, 255) : Colors.transparent,
                                diets[index].viewIsSelected ? const Color.fromARGB(255, 218, 139, 252) : Colors.transparent,
                              ]
                            )
                          ),
                          child: Center(
                            child: Text("View",
                            style: TextStyle(
                              color: diets[index].viewIsSelected ? Colors.white : const Color.fromARGB(255, 218, 139, 252)
                            )
                            )
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: diets.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
              ),
            )
          ],
        );
  }

  Container searchMenu() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 30, 20, 10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 10.0),
      ]),
      child: TextField(
          decoration: InputDecoration(
              hintText: "Sugar Pancake",
              prefixIcon: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.search),
              ),
              suffixIcon: SizedBox(
                width: 100,
                child: const IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      VerticalDivider(
                        color: Colors.black,
                        thickness: 0.1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.filter_list),
                      ),
                    ],
                  ),
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(15),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none))),
    );
  }

  AppBar navigasi() {
    return AppBar(
      title: const Text(
        "Breakfast",
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0, //menghilangkan shadow
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffF7F8F8)),
          child: SvgPicture.asset(
            'assets/back_arrow.svg',
            width: 20,
            height: 20,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          child: Container(
            alignment: Alignment.center,
            width: 30,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffF7F8F8)),
            child: SvgPicture.asset(
              'assets/dot2.svg',
              width: 18,
              height: 18,
            ),
          ),
        ),
      ],
    );
  }
}

class categorySelection extends StatelessWidget {
  const categorySelection({
    super.key,
    required this.categories,
  });

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Text(
            'Category',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 0),
          child: SizedBox(
            // color: Colors.green,
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 115,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: categories[index].boxColor.withOpacity(0.4),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 65,
                        height: 65,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset(categories[index].iconPath),
                        ),
                      ),
                      Text(
                        categories[index].nameItem,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
