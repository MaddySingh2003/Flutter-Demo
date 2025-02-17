import 'package:flutter/material.dart';
import 'package:grow_up/c_widgets/t_meal.dart';
import 'package:grow_up/common/color_e.dart';
import 'package:grow_up/common/eat_cell.dart';
import 'package:grow_up/common/meal_cell.dart';
import 'package:grow_up/common/meal_reeec.dart';
import 'package:grow_up/common/popula_m.dart';
import 'package:grow_up/common/r_button.dart';

class MealDetail extends StatefulWidget {
  final Map eObj;
  const MealDetail({super.key, required this.eObj});

  @override
  State<MealDetail> createState() => _MealDetailState();
}

class _MealDetailState extends State<MealDetail> {
  TextEditingController txtSearch = TextEditingController();
  List planmArr = [
    {
      "name": "Salmon Nigiri",
      "image": "assets/img/nigiri 1.png",
      "time": "Today 08:00 AM",
    },
    {
      "name": "Lowfat Milk",
      "image": "assets/img/glass-of-milk 1.png",
      "time": "Today 09:00 AM"
    },
  ];
  List popularArr = [
    {
      "name": "Blueberry Pancake",
      "image": "assets/img/bu_pan.png",
      "time": "30mins",
      "kcal": "230",
      "size": "Medium",
    },
    {
      "name": "Salmon Nigiri",
      "image": "assets/img/nigiri 1.png",
      "time": "20mins",
      "kcal": "120",
      "size": "Medium",
    },
  ];
  List recoArr = [
    {
      "name": "Honey Pancake",
      "image": "assets/img/cake.png",
      "time": "30mins",
      "kcal": "180",
      "size": "Easy",
    },
    {
      "name": "Canai Bread",
      "image": "assets/img/bread.png",
      "time": "20mins",
      "kcal": "230",
      "size": "Easy",
    },
  ];
  List categArr = [
    {
      "name": "Salad",
      "image": "assets/img/salad.png",
    },
    {
      "name": "Cake",
      "image": "assets/img/cake.png",
    },
    {
      "name": "Pie",
      "image": "assets/img/pie.png",
    },
    {
      "name": "Smoothie",
      "image": "assets/img/smoothie.png",
    },
    {
      "name": "Salad",
      "image": "assets/img/salad.png",
    },
    {
      "name": "Cake",
      "image": "assets/img/cake.png",
    },
    {
      "name": "Pie",
      "image": "assets/img/pie.png",
    },
    {
      "name": "Smoothie",
      "image": "assets/img/smoothie.png",
    },
  ];
  List fplanmArr = [
    {
      "name": "Breakfast",
      "image": "assets/img/cheeryb.png",
      "number": "120+ Food",
    },
    {"name": "Lunch", "image": "assets/img/yogurt.png", "number": "130+ Food"},
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.9),
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: TableColor.lightGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.arrow_back),
          ),
        ),
        title: Text(
          "Meal Planner",
          style: TextStyle(
            color: TableColor.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: TableColor.lightGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.more_vert_outlined),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 255, 204, 231),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                  color: TableColor.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    ),
                  ]),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: txtSearch,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search_outlined),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: "Search"),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 30,
                    color: TableColor.gray.withOpacity(0.3),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(Icons.filter_alt_outlined),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Category",
                        style: TextStyle(
                          color: TableColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  SizedBox(
                    height: 110,
                    width: media.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categArr.length,
                        itemBuilder: (context, index) {
                          var fObj = categArr[index] as Map? ?? {};
                          return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        MealDetail(eObj: fObj),
                                  ),
                                );
                              },
                              child: MealCell(cObj: fObj, index: index));
                        }),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: media.width * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Recommendation\nfor Diet",
                style: TextStyle(
                  color: TableColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: media.width * 0.65,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  scrollDirection: Axis.horizontal,
                  itemCount: recoArr.length,
                  itemBuilder: (context, index) {
                    var fObj = recoArr[index] as Map? ?? {};
                    return InkWell(
                        onTap: () {},
                        child: MealRecc(fObj: fObj, index: index));
                  }),
            ),
            SizedBox(
              height: media.width * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Popular",
                style: TextStyle(
                  color: TableColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                shrinkWrap: true,
                itemCount: popularArr.length,
                itemBuilder: (context, index) {
                  var fObj = popularArr[index] as Map? ?? {};
                  return InkWell(
                      onTap: () {},
                      child: PopularMeal(
                        mObj: fObj,
                      ));
                }),
            SizedBox(
              height: media.width * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
