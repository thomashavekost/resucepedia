import 'dart:convert';

import 'package:RescuePedia/models/medication.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/drug.dart';

class DrugService{

  final String _url = 'rescuepedia.moto-systems.de';

  List<Drug> reaDrugs = [
    Drug(name: 'Adrenalin', color: Colors.red),
    Drug(name: 'Amiodaron', color: Colors.blue),
    Drug(name: 'ASS', color: Colors.blue),
    Drug(name: 'Heparin', color: Colors.blueAccent),
    Drug(name: 'Fentanyl', color: Colors.yellow),
    Drug(name: 'Midazolam', color: Colors.green),
  ];

  fetchMedications() async {
    const endpoint = 'api/medications';

    final response = await http.get(Uri.https(_url, endpoint), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      List<Medication> result = [];
      jsonResponse.forEach((val) {
        result.add(Medication.fromJson(val));
      });
      return result;
    } else {
      return false;
    }
  }
}