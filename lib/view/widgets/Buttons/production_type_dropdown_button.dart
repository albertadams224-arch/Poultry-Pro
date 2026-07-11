import 'package:flutter/material.dart';
import 'package:poultry_pro/model/production_category.dart';

class ProductionTypeDropdown extends StatelessWidget {
  final ProductionType? value;
  final ValueChanged<ProductionType?> onChanged;

  const ProductionTypeDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<ProductionType>(
      initialValue: value,
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      hint: const Text('Select type'),
      items: ProductionType.values.map((type) {
        return DropdownMenuItem(value: type, child: Text(type.label));
      }).toList(),
      onChanged: onChanged,
      validator: (value) {
        if (value == null) return 'Please select a type';
        return null;
      },
    );
  }
}
