import 'package:flutter/material.dart';

class CustomButtonBar extends StatefulWidget {
  const CustomButtonBar({
    super.key,
  });

  @override
  State<CustomButtonBar> createState() => _CustomButtonBarState();
}

List<String> itemTypes = ["All", "Indoor", "Outdoor", "Flows", "Garden"];

int currentIndex = 0;

class _CustomButtonBarState extends State<CustomButtonBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      child: ListView.builder(
        itemCount: itemTypes.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  currentIndex = index;
                });
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                    color: currentIndex == index ? Colors.green : Colors.black),
              ),
              child: Text(
                itemTypes[index],
                style: TextStyle(
                    color: currentIndex == index ? Colors.green : Colors.black),
              ),
            ),
          );
        },
      ),
    );
  }
}
