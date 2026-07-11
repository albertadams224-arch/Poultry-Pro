import 'package:flutter/material.dart';

class StatusContainer extends StatelessWidget {
  const StatusContainer({super.key, required this.status});
  final String status;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(6),

        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.scrim,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child: Text(status)),
      ),
    );
  }
}
