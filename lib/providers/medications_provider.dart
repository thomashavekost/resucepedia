import 'package:RescuePedia/models/medication.dart';
import 'package:RescuePedia/services/drug_service.dart';
import 'package:flutter/cupertino.dart';

class MedicationProvider extends ChangeNotifier{

  bool _isLoading = true;
  List<Medication> _medications = [];

  bool get isLoading => _isLoading;
  List<Medication> get medications => _medications;

  void init(){
    getMedications();
  }

  void getMedications() async {
    _medications = await DrugService().fetchMedications();
    _isLoading = false;
    notifyListeners();
  }
}