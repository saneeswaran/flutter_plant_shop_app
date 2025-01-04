import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/provider_service.dart';
import '../widgets/custom_card_view.dart';
import 'detail_page.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<PlantProvider>(context).favorites;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
        height: height * 1,
        child: ListView.builder(
            itemCount: favorites.length,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final plant = favorites[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                                plantId: plantList[index].plantId,
                                plant: plantList[index],
                              )));
                },
                child: ListTile(
                  leading: Image.asset(plantList[index].imageURL),
                  title: Text(plantList[index].plantName),
                  subtitle: Text('${plant.category} - Rs. ${plant.price}'),
                ),
              );
            }),
      ),
    );
  }
}
