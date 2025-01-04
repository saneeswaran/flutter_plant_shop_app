import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_shop_ui/data/plants.dart';
import '../screens/detail_page.dart';

class CustomListview extends StatefulWidget {
  const CustomListview({super.key});

  @override
  State<CustomListview> createState() => _CustomListviewState();
}

List<Plant> plantList = Plant.plantList;

class _CustomListviewState extends State<CustomListview> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
        width: width * 1,
        child: ListView.builder(
            itemCount: plantList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: height * 0.10,
                width: width * 1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: DetailPage(
                              plantId: plantList[index].plantId,
                              plant: plantList[index],
                            )));
                  },
                  child: ListTile(
                    title: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          height: 100,
                          width: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(plantImages[index]),
                                fit: BoxFit.contain),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              plantList[index].plantName,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              plantList[index].category,
                              style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: Text(
                      "Rs. ${plantList[index].price}",
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ),
                ),
              );
            }));
  }
}
