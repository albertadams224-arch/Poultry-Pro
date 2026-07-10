import 'package:flutter/material.dart';
import 'package:poultry_pro/view/widgets/Containers/production_info_container.dart';

class Production extends StatefulWidget {
  const Production({super.key});

  @override
  State<Production> createState() => _ProductionState();
}

class _ProductionState extends State<Production> {
  String _isSelected = 'Eggs';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Production',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          Padding(
            padding: const EdgeInsetsGeometry.symmetric(horizontal: 20),
            child: InkWell(
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.add, color: Colors.black, size: 20),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsetsGeometry.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF21262D),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ProductionInfoContainer(
                          title: 'Eggs',
                          onTap: () {
                            setState(() {
                              _isSelected = 'Eggs';
                            });
                          },
                          isSelected: 'Eggs' == _isSelected,
                        ),
                      ),
                      Expanded(
                        child: ProductionInfoContainer(
                          title: 'Feed',
                          onTap: () {
                            setState(() {
                              _isSelected = 'Feed';
                            });
                          },
                          isSelected: 'Feed' == _isSelected,
                        ),
                      ),
                      Expanded(
                        child: ProductionInfoContainer(
                          title: 'Vaccines',
                          onTap: () {
                            setState(() {
                              _isSelected = 'Vaccines';
                            });
                          },
                          isSelected: 'Vaccines' == _isSelected,
                        ),
                      ),
                      Expanded(
                        child: ProductionInfoContainer(
                          title: 'Mortality',
                          onTap: () {
                            setState(() {
                              _isSelected = 'Mortality';
                            });
                          },
                          isSelected: 'Mortality' == _isSelected,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
