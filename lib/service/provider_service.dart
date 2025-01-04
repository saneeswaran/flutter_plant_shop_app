import 'package:flutter/material.dart';

import '../data/plants.dart';

class PlantProvider with ChangeNotifier {
  final List<Plant> _cart = [];
  final List<Plant> _favorites = [];

  List<Plant> get cart => _cart;
  List<Plant> get favorites => _favorites;

  void addToCart(Plant plant) {
    _cart.add(plant);
    notifyListeners(); // Notify widgets about changes
  }

  void addToFavorites(Plant plant) {
    _favorites.add(plant);
    notifyListeners();
  }
}
