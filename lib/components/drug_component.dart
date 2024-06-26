import 'package:flutter/material.dart';

import '../models/drug.dart';

class DrugComponent extends StatelessWidget {
  const DrugComponent({super.key, required this.drug});

  final Drug drug;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: drug.color,
      ),
      height: 80,
      child: Center(
        child: Text(drug.name, style: Theme.of(context).textTheme.titleMedium,),
      ),
    );
  }
}
