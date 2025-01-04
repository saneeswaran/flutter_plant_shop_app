import 'package:flutter/material.dart';
import 'package:plant_shop_ui/pages/ongoing_page.dart';
import 'package:provider/provider.dart';

import 'service/provider_service.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PlantProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Plant shop ui",
      theme: ThemeData(fontFamily: "Poppins"),
      debugShowCheckedModeBanner: false,
      home: const OngoingPage(),
    );
  }
}
