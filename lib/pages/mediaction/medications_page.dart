import 'package:RescuePedia/pages/mediaction/medication_detail_page.dart';
import 'package:RescuePedia/providers/medications_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MedicationsPage extends StatefulWidget {
  const MedicationsPage({super.key});

  @override
  State<MedicationsPage> createState() => _MedicationsPageState();
}

class _MedicationsPageState extends State<MedicationsPage> {

  @override
  void initState() {
    Provider.of<MedicationProvider>(context, listen: false).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15),
      child: Center(
        child: Consumer<MedicationProvider>(
          builder: (BuildContext context, MedicationProvider provider, Widget? child) {
            if(provider.isLoading) {
              return CircularProgressIndicator();
            } else {
              return RefreshIndicator(
                  child: ListView.separated(
                    itemCount: provider.medications.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(provider.medications[index].name, style: Theme.of(context).textTheme.titleMedium,),
                        subtitle: Text(provider.medications[index].drug_name),
                        trailing: IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MedicationDetailPage(medication: provider.medications[index],)),
                            );
                          },
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) { return Divider(); },
                  ),
                  onRefresh: () async {
                    await Future.delayed(Duration(microseconds: 1000));
                    Provider.of<MedicationProvider>(context, listen: false).init();
                  }
              );
            }
          },
        ),
      ),
    );
  }
}
