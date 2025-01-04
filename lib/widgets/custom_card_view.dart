import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/plants.dart';
import '../screens/detail_page.dart';
import '../service/provider_service.dart';

class CustomCardView extends StatefulWidget {
  const CustomCardView({super.key});

  @override
  State<CustomCardView> createState() => _CustomCardViewState();
}

List<Plant> plantList = Plant.plantList;

class _CustomCardViewState extends State<CustomCardView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.42,
      width: width * 1,
      child: ListView.builder(
        itemCount: plantList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(
                            plant: plantList[index],
                            plantId: index,
                          )));
            },
            child: Card(
              color: Colors.white,
              shadowColor: Colors.black45,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: height * 0.20,
                    width: width * 0.60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(plantImages[index]))),
                    child: Container(
                      alignment: Alignment.topRight,
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            plantList[index].isFavorated =
                                !plantList[index].isFavorated;
                          });
                          Provider.of<PlantProvider>(context, listen: false)
                              .addToFavorites(plantList[index]);
                        },
                        icon: Icon(
                          plantList[index].isFavorated
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: plantList[index].isFavorated
                              ? Colors.red
                              : Colors.green,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    plantList[index].plantName,
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Rs. ${plantList[index].price}",
                    style: const TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  SizedBox(
                    height: height * 0.07,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () {
                        Provider.of<PlantProvider>(context, listen: false)
                            .addToCart(plantList[index]);
                      },
                      child: const Text(
                        "Add to cart",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class PageTransitionType {}

class PageTransition {}
