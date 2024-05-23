import 'package:RescuePedia/models/medication.dart';
import 'package:flutter/material.dart';

class MedicationDetailPage extends StatelessWidget {
  const MedicationDetailPage({super.key, required this.medication});

  final Medication medication;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(medication.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Wirkstoff', style: Theme.of(context).textTheme.titleMedium,),
              Text(medication.drug_name),
              SizedBox(height: 20,),
              Text('Indikation', style: Theme.of(context).textTheme.titleMedium,),
              Text(medication.indication),
              SizedBox(height: 20,),
              Text('Kontraindikation', style: Theme.of(context).textTheme.titleMedium,),
              Text(medication.contra_indication),
              SizedBox(height: 20,),
              Text('Dosierung Erwachsene', style: Theme.of(context).textTheme.titleMedium,),
              Text(medication.dose_adult),
              SizedBox(height: 20,),
              Text('Dosierung Kinder', style: Theme.of(context).textTheme.titleMedium,),
              Text(medication.dose_child),
              SizedBox(height: 20,),
              Text('Cave', style: Theme.of(context).textTheme.titleMedium,),
              Text(medication.cave ?? 'Keine Angaben zur Cave'),
              SizedBox(height: 20,),
              Text('Stillzeit', style: Theme.of(context).textTheme.titleMedium,),
              Text(medication.breastfeeding ?? 'Keine Angaben zur Stillzeit'),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
