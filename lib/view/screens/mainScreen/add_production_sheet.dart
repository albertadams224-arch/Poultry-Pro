import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:poultry_pro/view/widgets/Buttons/production_type_dropdown_button.dart';
import 'package:poultry_pro/view/widgets/custom_textfield.dart';
import 'package:poultry_pro/view_model/add_production_viewmodel.dart';
import 'package:poultry_pro/view_model/production_viewmodel.dart';

class AddProduction extends ConsumerStatefulWidget {
  const AddProduction({super.key});

  @override
  ConsumerState<AddProduction> createState() => _AddProductionState();
}

class _AddProductionState extends ConsumerState<AddProduction> {
  final _formKey = GlobalKey<FormState>();
  final _ad = AddProductionViewmodel();

  @override
  void dispose() {
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    ref.read(productonProvider.notifier).addProduction(_ad.addProduct());
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add  Entry',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 4),
                Text(
                  'Enter today\'s collection details',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
                const SizedBox(height: 28),

                _buildLabel(context, 'TYPE'),
                const SizedBox(height: 8),
                ProductionTypeDropdown(
                  value: _ad.selectedCategory,
                  onChanged: (newValue) {
                    if (newValue != null) {
                      setState(() {
                        _ad.selectedCategory = newValue;
                      });
                    }
                  },
                ),
                const SizedBox(height: 28),

                const SizedBox(height: 28),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel(context, 'QUANTITY'),
                          const SizedBox(height: 8),
                          CustomTextfield(
                            hintText: 'e.g. 120',
                            controller: _ad.birdCountController,
                            keyboardType: TextInputType.number,
                            validator: (value) => _ad.validateBirdCollected(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel(context, 'BROKEN'),
                          const SizedBox(height: 8),
                          CustomTextfield(
                            hintText: 'e.g. 3',
                            controller: _ad.brokenController,
                            keyboardType: TextInputType.number,
                            // validator: (value) => _ad.validateBrokem(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('Cancel'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _submit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Save',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
        letterSpacing: 0.5,
      ),
    );
  }
}
