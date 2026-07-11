import 'package:poultry_pro/model/production_category.dart';

class Production {
  final int collected;
  final int broken;
  final ProductionType category;
  final DateTime date;

  Production({
    required this.collected,
    required this.broken,
    required this.category,

    DateTime? date,
  }) : date = date ?? DateTime.now();
}
