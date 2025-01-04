import 'package:flutter/material.dart';
import 'package:plant_shop_ui/widgets/custom_card_view.dart';
import 'package:provider/provider.dart';

import '../service/provider_service.dart';
import 'detail_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    super.key,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<PlantProvider>(context).cart;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:
          // Center(
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             SizedBox(
          //               height: 100,
          //               child: Image.asset('assets/images/add-cart.png'),
          //             ),
          //             const SizedBox(
          //               height: 10,
          //             ),
          //             const Text(
          //               'Your Cart is Empty',
          //               style: TextStyle(
          //                 color: Colors.green,
          //                 fontWeight: FontWeight.w300,
          //                 fontSize: 18,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
        height: size.height,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: cart.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    final plant = cart[index];
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
                        subtitle:
                            Text('${plant.category} - Rs. ${plant.price}'),
                      ),
                    );
                  }),
            ),
            Column(
              children: [
                const Divider(
                  thickness: 1.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Totals',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      'Rs. ${cart.fold(0, (previousValue, element) => previousValue + element.price)}',
                      style: const TextStyle(
                        fontSize: 24.0,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
