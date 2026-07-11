import 'package:flutter/material.dart';

import 'package:poultry_pro/model/production.dart';

import 'package:poultry_pro/model/production_category.dart';

class AddProductionViewmodel {
  final costController = TextEditingController();
  final birdCountController = TextEditingController();
  final brokenController = TextEditingController();
  ProductionType selectedCategory = ProductionType.egg;

  String? validateCost() {
    final text = costController.text.trim();
    if (text.isEmpty) return 'Required';
    final cost = double.tryParse(text);
    if (cost == null) return 'Enter a valid number';
    if (cost < 0) return 'Cost cannot be negative';
    if (cost == 0) return 'Cost must be greater than 0';
    return null;
  }

  String? validateBirdCollected() {
    final text = birdCountController.text.trim();
    if (text.isEmpty) return 'required';
    if (int.tryParse(text) == null || int.parse(text) <= 0) {
      return 'Enter a valid bird count';
    }
    return null;
  }

  String? validateBrokem() {
    final text = brokenController.text.trim();
    if (text.isEmpty) return 'required';
    if (int.tryParse(text) == null || int.parse(text) < 0) {
      return 'Enter a valid count';
    }
    return null;
  }

  Production addProduct() {
    return Production(
      collected: int.tryParse(birdCountController.text.trim()) ?? 0,
      broken: int.tryParse(brokenController.text.trim()) ?? 0,
      category: selectedCategory,
    );
  }

  void dispose() {
    costController.dispose();
    birdCountController.dispose();
    brokenController.dispose();
  }
}
