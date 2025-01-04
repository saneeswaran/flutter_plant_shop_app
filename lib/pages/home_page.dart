import 'package:flutter/material.dart';
import 'package:plant_shop_ui/constants/constants.dart';
import 'package:plant_shop_ui/widgets/custom_button_bar.dart';
import 'package:plant_shop_ui/widgets/custom_card_view.dart';
import 'package:plant_shop_ui/widgets/custom_field.dart';

import '../data/plants.dart';
import '../widgets/custom_listview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

bool isClicked = false;
List<Plant> myFav = [];
List<Plant> myCart = [];

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 28,
              fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Constants.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomField(
                        hintText: "Plants",
                        icon: Icons.search,
                        iconColor: Colors.black,
                        filledColor: Colors.white,
                        controller: searchController,
                        suffixIcon: null,
                        suffixIconOnTap: () {}),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: const Icon(
                        Icons.filter_list,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              //buttonbar
              const CustomButtonBar(),
              SizedBox(
                height: height * 0.02,
              ),
              const CustomCardView(),
              SizedBox(
                height: height * 0.02,
              ),
              const Text(
                "New Plants",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const CustomListview(),
            ],
          ),
        ),
      ),
    );
  }
}
