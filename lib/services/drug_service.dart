import 'dart:convert';

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
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse['data'];
    } else {
      return false;
    }
  }
}